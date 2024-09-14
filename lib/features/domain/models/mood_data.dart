class MoodData {
  final String date;
  final int moodLevel;

  MoodData(this.date, this.moodLevel);

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'moodLevel': moodLevel,
    };
  }

  factory MoodData.fromJson(Map<String, dynamic> json) {
    return MoodData(
      json['date'],
      json['moodLevel'],
    );
  }
}
