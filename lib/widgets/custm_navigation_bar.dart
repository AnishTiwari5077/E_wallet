import 'package:e_wallet/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return SizedBox(
      height: 70,
      child: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(context, Icons.home, 0, "Home", nav.currentIndex == 0),
            _buildIcon(
              context,
              Icons.person,
              2,
              "Profile",
              nav.currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context,
    IconData icon,
    int index,
    String label,
    bool active,
  ) {
    return InkWell(
      onTap: () => context.read<NavigationProvider>().changeIndex(index),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active ? Colors.green : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.green : Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
