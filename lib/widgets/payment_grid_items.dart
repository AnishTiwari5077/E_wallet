import 'package:flutter/material.dart';
import '../models/payment_item.dart';

class PaymentItemsGrid extends StatelessWidget {
  final List<PaymentItem> paymentItems;

  const PaymentItemsGrid({super.key, required this.paymentItems});

  @override
  Widget build(BuildContext context) {
    // Limit to max 8 items (2 rows × 4 columns)
    final safeItems = paymentItems.take(8).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: safeItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columns per row
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8, // adjust to control spacing between icon/text
      ),
      itemBuilder: (context, index) {
        final item = safeItems[index];
        return GestureDetector(
          onTap: item.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(item.iconPath, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
