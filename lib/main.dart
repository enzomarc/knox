import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knox/core/providers/password_provider.dart';
import 'package:provider/provider.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/category_provider.dart';
import 'core/knox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializing DotEnv plugin
  await DotEnv().load('.env');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
        ),
      ],
      child: Knox(),
    ),
  );
}
