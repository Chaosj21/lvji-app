enum JournalStyle {
  concise('default', '简洁记录风'),
  poetic('poetic', '文艺抒情风'),
  guide('guide', '攻略实用风');

  final String value;
  final String label;

  const JournalStyle(this.value, this.label);

  static JournalStyle fromValue(String value) {
    return JournalStyle.values.firstWhere((s) => s.value == value, orElse: () => JournalStyle.concise);
  }
}
