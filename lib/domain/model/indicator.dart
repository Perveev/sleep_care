class Indicator {
  final String title;
  final String unit;
  final double defaultValue;
  final int? id;

  Indicator({
    required this.title,
    required this.unit,
    required this.defaultValue,
    this.id,
  });

  factory Indicator.test() {
    return Indicator(title: 'indicator', unit: 'Кг', defaultValue: 80);
  }
}
