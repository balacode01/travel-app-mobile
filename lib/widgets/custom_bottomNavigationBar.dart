// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double iconSize = screenWidth * 0.07;
//     return BottomNavigationBar(
//       currentIndex: widget.currentIndex,
//       onTap: widget.onTap,
//       selectedItemColor: Colors.blue,
//       unselectedItemColor: Colors.grey,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home, size: iconSize),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.feed, size: iconSize),
//           label: "Discover",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person, size: iconSize),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }
