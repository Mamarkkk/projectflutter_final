import 'package:flutter/material.dart';
import 'package:project1/components/my_button.dart';
import 'package:project1/components/my_text_field.dart';
import 'package:project1/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock_open_rounded,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
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
              MyButton(
                  text: "Register",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
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
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
