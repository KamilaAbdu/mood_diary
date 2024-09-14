class MoodCategoryData {
  final String category;
  final double percentage;

  MoodCategoryData(this.category, this.percentage);

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'percentage': percentage,
    };
  }

  factory MoodCategoryData.fromJson(Map<String, dynamic> json) {
    return MoodCategoryData(
      json['category'],
      json['percentage'],
    );
  }
}
