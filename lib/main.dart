import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/main_providers.dart';
import 'package:travel_app_mobile/routes/routes.dart';
import 'package:travel_app_mobile/screens/auth/register.dart';

void main() {
  runApp(MultiProvider(providers: appProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      initialRoute: Routes.signUp,
      routes: appRoutes,
      home: SignUpScreen(),
    );
  }
}
