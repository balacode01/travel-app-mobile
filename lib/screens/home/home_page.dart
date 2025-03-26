import 'package:flutter/material.dart';
import 'package:travel_app_mobile/screens/budget/budget_tracker_list.dart';
import 'package:travel_app_mobile/screens/discover/discover_screen.dart';
import 'package:travel_app_mobile/screens/feed/feed_screen.dart';
import 'package:travel_app_mobile/screens/profile/profile_settings.dart';
import 'package:travel_app_mobile/widgets/ct_fancy_bottom_navigation.dart';
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
    BudgetTrackerScreen(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //body: Center(child: Text("Selected Index: $_selectedIndex")),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
