class MoodData {
  final String date;
  final double moodLevel;

  MoodData(this.date, this.moodLevel);

  // Для преобразования в/из JSON
  Map<String, dynamic> toJson() => {
        'date': date,
        'moodLevel': moodLevel,
      };

  factory MoodData.fromJson(Map<String, dynamic> json) {
    return MoodData(json['date'], json['moodLevel']);
  }
}
