import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/core/providers/feed_provider.dart';
import 'package:travel_app_mobile/core/utils/token_storage.dart';
import 'package:travel_app_mobile/routes/routes.dart';
import 'package:travel_app_mobile/screens/auth/login.dart';
import 'package:travel_app_mobile/screens/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    MultiProvider(
      //providers: appProviders,
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FeedProvider()),
      ],
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
      routes: appRoutes,
      home: FutureBuilder<bool>(
        future: TokenStorage.isUserLoggedIn(),
        builder: (context, snapShot) {
          print("========++++========");
          if (snapShot.connectionState == ConnectionState.waiting) {
            print("Waiting");
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (snapShot.data == true) {
              print("Home : token stored");
              return HomePage();
            } else {
              print("Login : token not stored");
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}
