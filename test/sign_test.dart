import 'package:flutter_test/flutter_test.dart';

import 'package:astro_app/utils/zodiac_utils.dart';

void main() {
  test('maps representative zodiac dates', () {
    expect(getZodiacSign(DateTime(2024, 3, 21)), 'Aries');
    expect(getZodiacSign(DateTime(2024, 4, 20)), 'Tauro');
    expect(getZodiacSign(DateTime(2024, 5, 21)), 'Géminis');
    expect(getZodiacSign(DateTime(2024, 6, 21)), 'Cáncer');
    expect(getZodiacSign(DateTime(2024, 7, 23)), 'Leo');
    expect(getZodiacSign(DateTime(2024, 8, 23)), 'Virgo');
    expect(getZodiacSign(DateTime(2024, 9, 23)), 'Libra');
    expect(getZodiacSign(DateTime(2024, 10, 23)), 'Escorpio');
    expect(getZodiacSign(DateTime(2024, 11, 22)), 'Sagitario');
    expect(getZodiacSign(DateTime(2024, 12, 22)), 'Capricornio');
    expect(getZodiacSign(DateTime(2024, 1, 20)), 'Acuario');
    expect(getZodiacSign(DateTime(2024, 2, 19)), 'Piscis');
  });
}
