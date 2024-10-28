import 'package:flutter/material.dart';
import 'package:project1/components/my_button.dart';
import 'package:project1/components/my_text_field.dart';
import 'package:project1/screens/login_page.dart';
import 'package:project1/services/auth/auth_service.dart';
import 'package:project1/services/database/database_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = AuthService();
  final _db = DatabaseService();

  // text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmPasswordController =
      TextEditingController();

  void register() async {
    if (passwordController.text == comfirmPasswordController.text) {
      try {

        await _auth.registerEmailPassword(
            emailController.text, passwordController.text);

        await _db.saveUserInfoInFirebase(name: nameController.text, email: emailController.text);


      } catch (e) {
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
                title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'lib/assets/images/x.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Create an account.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //email
                MyTextField(
                    controller: nameController,
                    hintText: "Enter your name",
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                //passsword
                MyTextField(
                    controller: comfirmPasswordController,
                    hintText: "Confirm your password",
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(text: "Register", onTap: register),

                const SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //tap to register page
                    GestureDetector(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: widget.onTap,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
