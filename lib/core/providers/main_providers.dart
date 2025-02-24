import 'auth_provider.dart';

import 'package:provider/provider.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];
