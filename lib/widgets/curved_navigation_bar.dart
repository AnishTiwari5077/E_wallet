import 'package:e_wallet/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurvedBottomNavBar extends StatelessWidget {
  const CurvedBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Background curve
        CustomPaint(
          size: const Size(double.infinity, 70),
          painter: _CurvedPainter(),
        ),

        // Navigation icons
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                icon: Icons.home,
                index: 0,
                isActive: nav.currentIndex == 0,
              ),
              const SizedBox(width: 70),

              _buildNavItem(
                context,
                icon: Icons.person,
                index: 1,
                isActive: nav.currentIndex == 1,
              ),
              _buildNavItem(
                context,
                icon: Icons.abc_outlined,
                index: 2,
                isActive: nav.currentIndex == 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => context.read<NavigationProvider>().changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isActive ? Colors.green : Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}

class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    // ..style = PaintingStyle.fill
    //  ..shadowBlurSigma = 10
    // ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.35, 0)
      ..quadraticBezierTo(
        size.width * 0.40,
        0,
        size.width * 0.42,
        20,
      ) // left curve
      ..arcToPoint(
        Offset(size.width * 0.58, 20),
        radius: const Radius.circular(30),
        clockwise: false,
      )
      ..quadraticBezierTo(
        size.width * 0.60,
        0,
        size.width * 0.65,
        0,
      ) // right curve
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black26, 6, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
