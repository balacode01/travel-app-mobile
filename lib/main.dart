import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/routes/routes.dart';
import 'package:travel_app_mobile/screens/auth/login.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MultiProvider(
      //providers: appProviders,
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
      title: "Travel App",
      initialRoute: Routes.verifyOtp,
      routes: appRoutes,
      home: LoginPage(),
    );
  }
}
