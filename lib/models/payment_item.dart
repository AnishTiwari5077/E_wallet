import 'package:flutter/material.dart';

class PaymentItem {
  final String name;
  final String iconPath;
  final VoidCallback onTap; // Add this line

  const PaymentItem({
    required this.name,
    required this.iconPath,
    required this.onTap, // Add this line
  });
}
