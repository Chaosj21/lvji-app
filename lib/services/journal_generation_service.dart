import '../core/constants/journal_styles.dart';
import '../data/datasources/local/app_database.dart';

class JournalDraft {
  final String title;
  final List<String> paragraphs;

  const JournalDraft({required this.title, required this.paragraphs});
}

/// 后记生成的抽象接口。
///
/// Phase 4 阶段只有 [TemplateJournalGenerationService] 一个实现，纯本地模板拼接，不调用任何 AI。
///
/// 等你确定了后端方案（一个能替你保管 Claude API Key 的服务端/云函数）之后，
/// 只需要新写一个 `RemoteJournalGenerationService implements JournalGenerationService`，
/// 内部去 fetch 你自己的后端接口，然后把 `journalGenerationServiceProvider`（见 controller 文件）
/// 指向新的实现即可，UI 和 controller 完全不用改。
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
    // 模拟生成过程有个短暂延迟，避免界面上"生成"按钮点一下就瞬间完事，交互上更自然
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
