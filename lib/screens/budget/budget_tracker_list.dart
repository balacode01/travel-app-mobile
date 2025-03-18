import 'package:flutter/material.dart';

class BudgetTracker extends StatefulWidget {
  const BudgetTracker({super.key});

  @override
  State<BudgetTracker> createState() => _BudgetTrackerState();
}

class _BudgetTrackerState extends State<BudgetTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Budget list")));
  }
}
