import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import '../models/horoscope_entry.dart';

class HoroscopeRepository {
  HoroscopeRepository({Random? random}) : _random = random ?? Random();

  final Random _random;

  Future<List<HoroscopeEntry>> loadEntries() async {
    final rawJson = await rootBundle.loadString('assets/data/horoscopes.json');
    final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
    final items = decoded['predictions'] as List<dynamic>;

    return items
        .map((item) => HoroscopeEntry.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<HoroscopeEntry> pickEntry() async {
    final entries = await loadEntries();
    return entries[_random.nextInt(entries.length)];
  }
}
