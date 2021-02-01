import 'package:flutter/material.dart';
import 'package:knox/screens/dashboard.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => DashboardScreen(),
};
