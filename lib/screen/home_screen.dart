import 'package:e_wallet/models/payment_item.dart';

import 'package:e_wallet/provider/navigation_provider.dart';
import 'package:e_wallet/screen/profile_screen.dart';
import 'package:e_wallet/screen/setting_screen.dart';
import 'package:e_wallet/widgets/curved_navigation_bar.dart';
import 'package:e_wallet/widgets/green_container.dart';
import 'package:e_wallet/widgets/payment_grid_items.dart';

import 'package:e_wallet/widgets/promo_carosel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/promo_data.dart'; // contains promoList

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final screens = const [HomeView(), ProfileScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      extendBody: true,
      body: Consumer<NavigationProvider>(
        builder: (context, nav, child) {
          return IndexedStack(index: nav.currentIndex, children: screens);
        },
      ),
      bottomNavigationBar: const CurvedBottomNavBar(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Layout')),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),

        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Logo.png', height: 40),
                  InkWell(
                    onTap: () {
                      //   print('tapped');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: const Color.fromARGB(255, 224, 221, 221),
                      ),
                      child: Image.asset(
                        'assets/icon.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Balance/Actions Section ---
              const GreenContainerWithActions(),
              const SizedBox(height: 18),

              // --- Payment Items Section ---
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Payment list',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              PaymentItemsGrid(
                paymentItems: [
                  PaymentItem(
                    name: 'Electricity',
                    iconPath: 'assets/icon/elecricity.svg',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'Internet',
                    iconPath: 'assets/icon/internet.svg',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'Topup',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'd',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'e',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'f',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'g',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                  PaymentItem(
                    name: 'h',
                    iconPath: 'assets/icon.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Promo Section ---
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Promotions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // ✅ Single promo carousel (handles looping, auto-scroll, preview)
              SizedBox(
                height: 300,
                child: PromoCarousel(
                  promoList: promoList,
                  autoScrollDelay: const Duration(seconds: 3),
                ),
              ),
              const SizedBox(height: 24),
              Text('heello'),
              const SizedBox(height: 24),
              Text('heello'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SizedBox(
          height: 20,
          width: 20,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: SvgPicture.asset(
              'assets/icon/qr.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );

    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  }
}
