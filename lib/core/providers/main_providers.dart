import 'package:travel_app_mobile/core/providers/feed_provider.dart';

import 'auth_provider.dart';

import 'package:provider/provider.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => FeedProvider()),
];
