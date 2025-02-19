import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/screens/auth/register.dart';
import 'core/providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Provider API Example",
      home: SignUpScreen(),
    );
  }
}
