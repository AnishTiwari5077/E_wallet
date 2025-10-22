import 'package:e_wallet/models/promo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  const PromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (promo.destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => promo.destination!),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: promo.imagePath.endsWith('.svg')
              ? SvgPicture.asset(
                  promo.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160,
                )
              : Image.asset(
                  promo.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160,
                ),
        ),
      ),
    );
  }
}
