import 'package:e_wallet/models/promo_model.dart';

import 'package:e_wallet/screen/promo_details_screen.dart';

final List<Promo> promoList = [
  Promo(
    imagePath: 'assets/icon/promo.png',
    destination: const PromoDetailScreen(
      title: 'Summer Sale',
      description: 'Enjoy 50% off on all electronics this season!',
      imagePath: 'assets/images/promo_1.svg',
    ),
  ),
  Promo(
    imagePath: 'assets/images/promo_2.svg',
    destination: const PromoDetailScreen(
      title: 'New Arrivals',
      description: 'Check out our latest gadgets and accessories.',
      imagePath: 'assets/images/promo_2.svg',
    ),
  ),
  Promo(
    imagePath: 'assets/images/promo_3.svg',
    destination: const PromoDetailScreen(
      title: 'Flash Deals',
      description: 'Limited time offers — grab them before they’re gone!',
      imagePath: 'assets/images/promo_3.svg',
    ),
  ),
];
