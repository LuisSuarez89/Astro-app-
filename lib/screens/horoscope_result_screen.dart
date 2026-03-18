import 'package:flutter/material.dart';

import '../models/horoscope_result.dart';
import '../widgets/cosmic_background.dart';

class HoroscopeResultScreen extends StatelessWidget {
  const HoroscopeResultScreen({required this.result, super.key});

  final HoroscopeResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CosmicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const SizedBox(height: 12),
                Text(
                  result.sign,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 36,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Para ${result.name}, nacido el ${result.birthDate.day}/${result.birthDate.month}/${result.birthDate.year}',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF20103B), Color(0xFF13071F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.stars_rounded, color: Color(0xFF4DE2C5)),
                          SizedBox(width: 10),
                          Text(
                            'Mensaje de los astros',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        result.prediction,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.7,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          'Tu intención del día: ${result.focus}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Zona futura para anuncio inicial y banner inferior.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
