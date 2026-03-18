class HoroscopeEntry {
  const HoroscopeEntry({required this.id, required this.quatrain});

  final int id;
  final String quatrain;

  factory HoroscopeEntry.fromJson(Map<String, dynamic> json) {
    return HoroscopeEntry(
      id: json['id'] as int,
      quatrain: json['quatrain'] as String,
    );
  }
}
