import 'package:flutter/material.dart';
import 'package:project1/components/my_drawer_tile.dart';
import 'package:project1/screens/login_page.dart';
import 'package:project1/screens/profile_page.dart';
import 'package:project1/screens/setting_page.dart';
import 'package:project1/services/auth/auth_service.dart';
import 'package:project1/services/auth/login_or_register.dart';

//left side of app bar

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final _auth = AuthService();
  
  void logout (){
    _auth.logout();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          
              //Line
              Divider(               
                color: Theme.of(context).colorScheme.secondary,
              ),

              //home
              MyDrawerTile(
                title: "HOME",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              
              MyDrawerTile(
                title: "PROFILE", 
                icon: Icons.person, 
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(uid: _auth.getCurrentUid()),
                    )
                  );
                }
              ),

              MyDrawerTile(
                title: "SETTING",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
