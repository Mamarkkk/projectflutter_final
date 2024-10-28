import 'package:flutter/material.dart';
import 'package:project1/components/my_button.dart';
import 'package:project1/components/my_text_field.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/register_page.dart';
import 'package:project1/screens/reset_password.dart';
import 'package:project1/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = AuthService();

  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async{
    try {
      await _auth.loginEmailPassword(emailController.text, passwordController.text);
    }
    catch (e){
      print(e.toString());
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
                  "Welcome to X, Please login.",
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
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                //passsword
                MyTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                //forgot password
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    )),
                const SizedBox(
                  height: 10,
                ),

                MyButton(text: "Login", 
                  onTap: login
                ),

                const SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //tap to register page
                    GestureDetector(
                      child: Text(
                        "Register",
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
