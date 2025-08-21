import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

class ApiKeys {
  static String get secretKey => dotenv.env['SECRET_KEY'] ?? "";
  static String get publicKey => dotenv.env['PUBLIC_KEY'] ?? "";

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
