import 'package:flutter/material.dart';
import 'package:travel_app_mobile/screens/discover/discover_screen.dart';
import 'package:travel_app_mobile/screens/feed/feed_screen.dart';
import 'package:travel_app_mobile/screens/profile_settings.dart';
import 'package:travel_app_mobile/widgets/custom_bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    FeedScreen(),
    DiscoverScreen(),
    ProfileSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
