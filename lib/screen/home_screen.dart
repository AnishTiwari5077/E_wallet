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
      // ✅ We retain extendBody: true to let the body content go behind the bottom nav bar
      extendBody: true,
      body: Consumer<NavigationProvider>(
        builder: (context, nav, child) {
          return IndexedStack(index: nav.currentIndex, children: screens);
        },
      ),
      bottomNavigationBar: const CurvedBottomNavBar(),

      // ✅ CONDITIONAL FLOATING ACTION BUTTON
      // We read the provider here to decide whether to render the FAB at all.
      floatingActionButton: Consumer<NavigationProvider>(
        builder: (context, nav, child) {
          // Only return the FAB widget if the current index is 0 (HomeView)
          if (nav.currentIndex == 0) {
            return FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green, // Ensure your FAB styling is here
              shape: const CircleBorder(),
              child: SizedBox(
                height: 24, // Increased size for visibility, adjust as needed
                width: 24,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icon/qr.svg',
                    height: 20,
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            );
          }
          // Return null if it's not the home screen (index != 0)
          return const SizedBox.shrink();
        },
      ),

      // ✅ Use the Scaffold's location property for fixed positioning
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
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
        physics: const AlwaysScrollableScrollPhysics(), // Corrected syntax
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
                    onTap: () {},
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

              SizedBox(
                height: 300,
                child: PromoCarousel(
                  promoList: promoList,
                  autoScrollDelay: const Duration(seconds: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
