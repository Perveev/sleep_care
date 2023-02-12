class AgeCategory {
  final int min;
  final int max;
  final int? id;
  final String title;

  AgeCategory({
    required this.min,
    required this.max,
    this.id,
    required this.title,
  });
}
