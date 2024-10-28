import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/login_page.dart';
import 'package:project1/screens/register_page.dart';
import 'package:project1/screens/reset_password.dart';
import 'package:project1/screens/setting_page.dart';
import 'package:project1/services/auth/check_gate.dart';
import 'package:project1/services/auth/login_or_register.dart';
import 'package:project1/services/database/database_provider.dart';
import 'package:project1/themes/dark_mode.dart';
import 'package:project1/themes/theme_change,.dart';
import 'package:provider/provider.dart';




void main() async{

  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeChange()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
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
      initialRoute: '/',
      routes: {'/': (context) => const CheckGate()},
      theme: Provider.of<ThemeChange>(context).themeData,
    );
  }
}