import 'package:flutter/material.dart';

class GreenContainerWithActions extends StatelessWidget {
  const GreenContainerWithActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      height: 84,
      decoration: BoxDecoration(
        color: const Color(0xFF4CD080),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          _buildVerticalSeparator(left: 111),
          _buildVerticalSeparator(left: 231),
          _buildActionColumn(
            left: 8,
            iconPath: 'assets/transfer.png', // Replace with your icon path
            text: 'Transfer',
            onTap: () {
              // Handle Transfer tap
            },
          ),
          _buildActionColumn(
            left: 122,
            iconPath: 'assets/topup.png', // Replace with your icon path
            text: 'Top Up',
            onTap: () {
              // Handle Top Up tap
            },
          ),
          _buildActionColumn(
            left: 237,
            iconPath: 'assets/history.png', // Replace with your icon path
            text: 'History',
            onTap: () {
              // Handle History tap
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalSeparator({required double left}) {
    return Positioned(
      left: left,
      top: 14,
      child: Opacity(
        opacity: 0.30,
        child: Container(
          width: 1,
          height: 57,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.50, -0.00),
              end: const Alignment(0.50, 1.00),
              colors: [Colors.white, Colors.white, Colors.white],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionColumn({
    required double left,
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Positioned(
      left: left,
      top: 8,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 98,
          height: 68,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                // This is a placeholder for your icon.
                // You would typically use Image.asset or an Icon widget here.
                // If using a custom icon, you would place it within the Container.
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(iconPath),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
