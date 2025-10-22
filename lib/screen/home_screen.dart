import 'package:e_wallet/models/payment_item.dart';
import 'package:e_wallet/provider/navigation_provider.dart';
import 'package:e_wallet/screen/profile_screen.dart';
import 'package:e_wallet/screen/setting_screen.dart';
import 'package:e_wallet/widgets/curved_navigation_bar.dart';
import 'package:e_wallet/widgets/green_container.dart';
import 'package:e_wallet/widgets/payment_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Define screens as a const list since its contents are const.
  final screens = const [HomeView(), ProfileScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    print('HomeScreen build called1');
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 215, 204),
      extendBody: true,
      body: Consumer<NavigationProvider>(
        builder: (context, nav, child) {
          return IndexedStack(index: nav.currentIndex, children: screens);
        },
      ),
      bottomNavigationBar: CurvedBottomNavBar(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print('HomeView build called');
    // Note: If you add widgets inside, ensure they are also const if possible.
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Layout')),
      body: SingleChildScrollView(
        // Allows scrolling if content overflows
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // First section: two columns, each with two horizontal items
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/Logo.png'),

                            InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: const Color.fromARGB(
                                    255,
                                    224,
                                    221,
                                    221,
                                  ),
                                ),

                                child: Image.asset(
                                  height: 24,
                                  width: 24,
                                  'assets/icon.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('hello world'),
                                Text('hello world'),
                              ],
                            ),
                            SizedBox(height: 50),
                            GreenContainerWithActions(), // Spacing between rows
                          ],
                        ), // Spacing between rows
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24), // Spacing between sections
              // Payment items section
              Padding(
                padding: const EdgeInsets.all(16.0),
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
              ), // Widget for responsive payment items
            ],
          ),
        ),
      ),
    );
  }
}
