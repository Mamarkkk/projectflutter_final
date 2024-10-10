import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/login_page.dart';
import 'package:project1/screens/register_page.dart';
import 'package:project1/screens/reset_password.dart';
import 'package:project1/screens/setting_page.dart';
import 'package:project1/screens/user_setting.dart';
import 'package:project1/themes/dark_mode.dart';
import 'package:project1/themes/theme_change,.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChange(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeChange>(context).themeData,
    );
  }
}