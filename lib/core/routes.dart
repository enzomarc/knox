import 'package:flutter/material.dart';
import 'package:knox/screens/auth/code.dart';
import 'package:knox/screens/auth/register.dart';
import 'package:knox/screens/auth/unlock.dart';
import 'package:knox/screens/dashboard.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/register/general": (context) => RegisterScreen(),
  "/register/code": (context) => CodeScreen(),
  "/dashboard": (context) => DashboardScreen(),
  "/unlock": (context) => UnlockScreen(),
};
