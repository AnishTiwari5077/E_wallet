import 'package:e_wallet/models/promo_model.dart';

class PromoData {
  final List<Promo> promoData = [
    Promo(
      imageUrl: 'https://example.com/promo1.jpg',
      title: 'Summer Sale!',
      description: 'Get up to 50% off on selected items.',
    ),
    Promo(
      imageUrl: 'https://example.com/promo2.jpg',
      title: 'New Arrivals',
      description: 'Discover our latest collection.',
    ),
    Promo(
      imageUrl: 'https://example.com/promo3.jpg',
      title: 'Weekend Special',
      description: 'Exclusive deals for this weekend only.',
    ),
    // Add more promo items as needed
  ];
}
