import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/routes/routes.dart';
import 'package:travel_app_mobile/screens/auth/login.dart';
import 'package:travel_app_mobile/screens/home/home_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
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
      initialRoute: Routes.homePage,
      routes: appRoutes,
      home: HomePage(),
    );
  }
}
