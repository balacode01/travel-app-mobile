import 'package:flutter/material.dart';

class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    print("initState() called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies() called");
  }

  @override
  Widget build(BuildContext context) {
    print("build() called");
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Lifecycle Demo")),
      body: Center(child: Text("Check the console for lifecycle logs")),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget() called");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate() called");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose() called");
  }
}
