class HoroscopeResult {
  const HoroscopeResult({
    required this.name,
    required this.sign,
    required this.birthDate,
    required this.focus,
    required this.prediction,
  });

  final String name;
  final String sign;
  final DateTime birthDate;
  final String focus;
  final String prediction;
}
