import 'package:e_wallet/provider/navigation_provider.dart';
import 'package:e_wallet/screen/profile_screen.dart';
import 'package:e_wallet/screen/setting_screen.dart';
import 'package:e_wallet/widgets/custm_navigation_bar.dart';
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
      backgroundColor: Colors.amber,
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
    return const Center(
      child: Text(
        '🏠 Welcome to Home Dashboard other file aaaaa',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
