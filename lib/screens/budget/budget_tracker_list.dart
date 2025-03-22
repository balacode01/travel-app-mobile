import 'package:flutter/material.dart';

class BudgetTrackerScreen extends StatefulWidget {
  const BudgetTrackerScreen({super.key});

  @override
  State<BudgetTrackerScreen> createState() => _BudgetTrackerState();
}

class _BudgetTrackerState extends State<BudgetTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Budget list")));
  }
}
