class IndicatorsValue {
  final int temperature;
  final int shine;
  final int noize;
  final int vlaga;

  IndicatorsValue({
    required this.temperature,
    required this.shine,
    required this.noize,
    required this.vlaga,
  });

  factory IndicatorsValue.test(){
    return IndicatorsValue(temperature: 8, shine: 80, noize: 80, vlaga: 80);
  }
}
