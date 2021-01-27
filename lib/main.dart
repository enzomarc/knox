import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nuage/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/nuage.dart';

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
      ],
      child: Nuage(),
    ),
  );
}
