import 'dart:async';
import 'package:flutter/material.dart';
import 'package:e_wallet/models/promo_model.dart';
import 'package:e_wallet/widgets/promo_card.dart';

class PromoCarousel extends StatefulWidget {
  final List<Promo> promoList;
  final Duration autoScrollDelay;

  const PromoCarousel({
    super.key,
    required this.promoList,
    this.autoScrollDelay = const Duration(seconds: 3),
  });

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.95);

    // 🔁 Auto-scroll
    if (widget.promoList.isNotEmpty) {
      _timer = Timer.periodic(widget.autoScrollDelay, (_) {
        if (!mounted) return;
        _currentPage = (_currentPage + 1) % widget.promoList.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.promoList.isEmpty) {
      return const Center(
        child: Text(
          'No promotions available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return SizedBox(
      height: 230,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.promoList.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.85, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: PromoCard(promo: widget.promoList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
