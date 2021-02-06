import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'resources/dio_wrapper.dart';
import '../core/routes.dart';
import '../core/providers/theme_provider.dart';

class Knox extends StatelessWidget {
  final String defaultRoute;

  const Knox({Key key, this.defaultRoute = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DotEnv().env['APP_NAME'],
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: defaultRoute,
      theme: context.watch<ThemeProvider>().appTheme,
      navigatorKey: dioWrapper.navigatorKey,
    );
  }
}
