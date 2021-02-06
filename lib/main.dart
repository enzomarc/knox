import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knox/core/providers/password_provider.dart';
import 'package:knox/core/providers/user_provider.dart';
import 'package:knox/core/services/user_service.dart';
import 'package:provider/provider.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/category_provider.dart';
import 'core/knox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String defaultRoute;

  // initialize dotenv
  await DotEnv().load('.env');

  // load page to show
  defaultRoute = await userService.getAccount() != null ? '/unlock' : '/register/general';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
        ),
      ],
      child: Knox(defaultRoute: defaultRoute),
    ),
  );
}
