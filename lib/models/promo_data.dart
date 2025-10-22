import 'package:e_wallet/models/promo_model.dart';

final List<Promo> promoList = [
  const Promo(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Summer Sale',
    description: 'Get up to 50% off on all items!',
  ),
  const Promo(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'New Arrivals',
    description: 'Check out our latest collection.',
  ),
  const Promo(
    imageUrl: null, // intentionally no image to test fallback
    title: 'Free Delivery',
    description: 'Free shipping on orders over \$100.',
  ),
  const Promo(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Flash Deal',
    description: 'Limited time offer on selected items.',
  ),
];
