import 'package:flutter/material.dart';
import 'package:project1/components/my_drawer_tile.dart';
import 'package:project1/screens/login_page.dart';
import 'package:project1/screens/setting_page.dart';

//left side of app bar

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
          
              //setting
              MyDrawerTile(
                title: "SETTING",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
              ),

              const Spacer(),

              MyDrawerTile(
                title: "LOG OUT",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),



            ],
          ),
        ),
      ),
    );
  }
}
