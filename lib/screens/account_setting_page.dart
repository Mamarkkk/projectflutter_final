import 'package:flutter/material.dart';
import 'package:project1/services/auth/auth_service.dart';
import 'package:project1/services/auth/login_or_register.dart';
import 'package:project1/services/auth/check_gate.dart';


class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {

  void confirmDeletion(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Delete Account?"),
      content: const Text("Are you sure you want to delete this account?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text("cancel")
        ),

        TextButton(
          onPressed: () async{
            await AuthService().deleteAccount();

            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false );
            
          }, 
          child: const Text("Delete")),

      ],
    )
    );
  }


  @override
  Widget build(BuildContext context) {

    final auth = AuthService();
  
    void logout() async {
      await auth.logout();
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Account Setting"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () =>  confirmDeletion(context),
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                child: Text(
                  "Delete Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
            
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: logout,
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
