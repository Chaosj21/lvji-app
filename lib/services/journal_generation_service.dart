import 'dart:convert';
import '../core/constants/journal_styles.dart';
import '../data/datasources/local/app_database.dart';
import 'ai_service.dart';

class JournalDraft {
  final String title;
  final List<String> paragraphs;

  const JournalDraft({required this.title, required this.paragraphs});
}

/// 后记生成的抽象接口。
///
/// 两个实现：
/// - [TemplateJournalGenerationService]：纯本地模板拼接，不调用任何 AI，默认渠道
/// - [AIJournalGenerationService]：调用用户在设置里自己配置的 AI（[AIService]）
abstract class JournalGenerationService {
  Future<JournalDraft> generate({
    required String tripTitle,
    required String destination,
    required List<Moment> moments,
    required List<Expense> expenses,
    required JournalStyle style,
  });
}

/// 本地模板版本：把随记内容按天整理成段落，套用不同风格的开头/连接语。
/// 没有网络请求、不需要任何 Key，纯粹是数据整理 + 文案拼接。
class TemplateJournalGenerationService implements JournalGenerationService {
  @override
  Future<JournalDraft> generate({
    required String tripTitle,
    required String destination,
    required List<Moment> moments,
    required List<Expense> expenses,
    required JournalStyle style,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final byDay = <int, List<Moment>>{};
    for (final m in moments) {
      byDay.putIfAbsent(m.dayNumber, () => []).add(m);
    }
    final days = byDay.keys.toList()..sort();

    final title = _buildTitle(tripTitle, destination, style);
    final paragraphs = <String>[];

    if (days.isEmpty) {
      paragraphs.add(_emptyStateParagraph(style));
    } else {
      for (final day in days) {
        final dayMoments = byDay[day]!..sort((a, b) => a.recordedAt.compareTo(b.recordedAt));
        final texts = dayMoments.map((m) => m.textContent.trim()).where((t) => t.isNotEmpty).toList();
        if (texts.isEmpty) continue;
        paragraphs.add(_buildDayParagraph(day, texts, style));
      }
      if (paragraphs.isEmpty) paragraphs.add(_emptyStateParagraph(style));
    }

    paragraphs.add(_buildClosingParagraph(style));

    return JournalDraft(title: title, paragraphs: paragraphs);
  }

  String _buildTitle(String tripTitle, String destination, JournalStyle style) {
    switch (style) {
      case JournalStyle.poetic:
        return '$destination，那些慢下来的时光';
      case JournalStyle.guide:
        return '$tripTitle · 完整记录与实用信息';
      case JournalStyle.concise:
        return tripTitle;
    }
  }

  String _buildDayParagraph(int day, List<String> texts, JournalStyle style) {
    final joined = texts.join(style == JournalStyle.guide ? '；' : '，');
    switch (style) {
      case JournalStyle.poetic:
        return '第 $day 天，$joined。时间像被拉长了一点，连风都走得慢一些。';
      case JournalStyle.guide:
        return 'Day $day：$joined。';
      case JournalStyle.concise:
        return 'Day $day：$joined。';
    }
  }

  String _emptyStateParagraph(JournalStyle style) {
    switch (style) {
      case JournalStyle.poetic:
        return '这一路没有留下太多文字，但风景应该都还记得。';
      case JournalStyle.guide:
        return '本次旅程随记内容较少，建议在旅途中多用"随记"功能记录，后记会更完整。';
      case JournalStyle.concise:
        return '这次旅程还没有留下随记内容。';
    }
  }

  String _buildClosingParagraph(JournalStyle style) {
    switch (style) {
      case JournalStyle.poetic:
        return '旅程总会结束，但这些片刻会留在这里，等下次翻起的时候，风声还在。';
      case JournalStyle.guide:
        return '以上为本次旅程的完整记录，费用明细见下方汇总。';
      case JournalStyle.concise:
        return '旅程结束，感谢一路的记录。';
    }
  }
}

/// 真 AI 版本：把随记内容整理成 prompt，交给用户自己配置的 [AIService] 生成。
///
/// 要求模型只返回 JSON（title + paragraphs 数组），方便稳定解析；
/// 如果模型没有听话返回合法 JSON，会 fallback 把整段返回文本当成唯一一段正文，
/// 保证至少能看到内容，不会白屏报错。
class AIJournalGenerationService implements JournalGenerationService {
  final AIService aiService;

  AIJournalGenerationService(this.aiService);

  @override
  Future<JournalDraft> generate({
    required String tripTitle,
    required String destination,
    required List<Moment> moments,
    required List<Expense> expenses,
    required JournalStyle style,
  }) async {
    final byDay = <int, List<Moment>>{};
    for (final m in moments) {
      byDay.putIfAbsent(m.dayNumber, () => []).add(m);
    }
    final days = byDay.keys.toList()..sort();

    final momentsText = days.isEmpty
        ? '（这次旅程还没有随记内容）'
        : days.map((day) {
            final texts = byDay[day]!.map((m) => m.textContent.trim()).where((t) => t.isNotEmpty).join('；');
            return 'Day $day：$texts';
          }).join('\n');

    final styleDesc = switch (style) {
      JournalStyle.poetic => '文艺抒情风格，注重情感和意境描写',
      JournalStyle.guide => '攻略实用风格，突出实用信息和建议',
      JournalStyle.concise => '简洁记录风格，自然平实',
    };

    final prompt = '''
你是一个旅行游记写手。请根据以下这次旅行的随手记录，帮用户整理成一篇游记。

旅程名称：$tripTitle
目的地：$destination
风格要求：$styleDesc

随记内容（按天）：
$momentsText

请只返回如下 JSON 格式，不要有任何其他文字、不要用 markdown 代码块包裹：
{"title": "游记标题", "paragraphs": ["第一段正文", "第二段正文"]}
''';

    final raw = await aiService.complete(prompt: prompt, maxTokens: 1200);

    try {
      final cleaned = raw.trim().replaceAll(RegExp(r'^```json'), '').replaceAll(RegExp(r'```$'), '').trim();
      final json = jsonDecode(cleaned) as Map<String, dynamic>;
      final title = json['title'] as String? ?? tripTitle;
      final paragraphs = (json['paragraphs'] as List?)?.map((e) => '$e').toList();
      if (paragraphs == null || paragraphs.isEmpty) {
        return JournalDraft(title: title, paragraphs: [raw]);
      }
      return JournalDraft(title: title, paragraphs: paragraphs);
    } catch (_) {
      return JournalDraft(title: tripTitle, paragraphs: [raw.isEmpty ? '生成失败，请检查 API Key 或网络后重试。' : raw]);
    }
  }
}
