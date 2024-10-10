import 'package:flutter/material.dart';
import 'package:project1/components/my_button.dart';
import 'package:project1/components/my_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Forgot Password", style: TextStyle(Theme.of(context).colorScheme.primary),),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your email and we'll send you a link to reset your password.",
              textAlign: TextAlign.center,
              ,
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: emailController,
              hintText: "Please enter your email",
              obscureText: false,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: "Send OTP",
              onTap: () {
                // Logic to send OTP goes here
                String email = emailController.text;
                print("Sending OTP to: $email");
                // Optionally, show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("OTP sent to $email",)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
