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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Icon(
                Icons.person_add,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 50),
              Text(
                "Create a new account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              // email
              MyTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              // password
              MyTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // confirm password
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm your password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyButton(
                text: "Register",
                onTap: () {
                  // Registration logic goes here
                  // For example, you can show a message or navigate back to the login page
                  Navigator.pop(context); // Navigate back to the LoginPage
                },
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())); // Navigate back to the LoginPage
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
