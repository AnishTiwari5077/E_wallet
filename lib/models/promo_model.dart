import 'package:flutter/material.dart';

class Promo {
  final String imagePath; // local asset (SVG or PNG)
  final Widget? destination; // screen to open on tap

  const Promo({required this.imagePath, this.destination});
}
