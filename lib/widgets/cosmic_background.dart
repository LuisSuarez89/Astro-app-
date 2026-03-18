import 'package:flutter/material.dart';

class CosmicBackground extends StatelessWidget {
  const CosmicBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF05010C),
            Color(0xFF16082C),
            Color(0xFF090114),
          ],
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: -30,
            right: -20,
            child: _GlowingOrb(size: 180, color: Color(0x339C6BFF)),
          ),
          const Positioned(
            bottom: 120,
            left: -40,
            child: _GlowingOrb(size: 160, color: Color(0x224DE2C5)),
          ),
          ..._buildStars(),
          child,
        ],
      ),
    );
  }

  List<Widget> _buildStars() {
    const stars = [
      Offset(28, 60),
      Offset(140, 120),
      Offset(290, 90),
      Offset(110, 260),
      Offset(330, 210),
      Offset(50, 420),
      Offset(280, 500),
      Offset(170, 620),
      Offset(320, 700),
    ];

    return stars
        .map(
          (offset) => Positioned(
            left: offset.dx,
            top: offset.dy,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(color: Colors.white54, blurRadius: 8),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}

class _GlowingOrb extends StatelessWidget {
  const _GlowingOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
