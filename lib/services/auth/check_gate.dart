import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/services/auth/login_or_register.dart';

class CheckGate extends StatelessWidget {
  const CheckGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return const HomePage();
          }
          else {
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}
