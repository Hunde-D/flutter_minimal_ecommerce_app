import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTabChange,
    required this.cartItemCount,
  });

  final void Function(int)? onTabChange;
  final int cartItemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 20,
        gap: 8,
        onTabChange: (value) => onTabChange!(value),
        padding: const EdgeInsets.all(16),
        tabs: [
          const GButton(icon: Icons.home, text: 'Shop'),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            leading: cartItemCount > 0
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(Icons.shopping_bag_rounded),
                      Positioned(
                        top: -3,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$cartItemCount',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
