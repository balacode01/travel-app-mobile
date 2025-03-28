import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Colors.red : Colors.grey,
            ),
            onPressed: () => onItemTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.pin_drop,
              color: selectedIndex == 1 ? Colors.red : Colors.grey,
            ),
            onPressed: () => onItemTapped(1),
          ),
          const SizedBox(width: 50), // Space for the floating button
          IconButton(
            icon: Icon(
              Icons.monetization_on,
              color: selectedIndex == 2 ? Colors.red : Colors.grey,
            ),
            onPressed: () => onItemTapped(2),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 3 ? Colors.red : Colors.grey,
            ),
            onPressed: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
