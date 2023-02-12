class SleepScore {
  final int score;
  final String date;
  final double interval;

  SleepScore(this.score, this.date, this.interval);

  factory SleepScore.test({int? score}) {
    return SleepScore(score ?? 8, '11.01.21', 8);
  }
}
