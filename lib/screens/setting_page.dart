import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/components/my_settings_tile.dart';
import 'package:project1/healper/navigation_pages.dart';
import 'package:project1/themes/dark_mode.dart';
import 'package:project1/themes/theme_change,.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      backgroundColor: Theme.of(context).colorScheme.surface,
      //2
      appBar: AppBar(
        title: const Text("SETTING"),
        //กำหนดสีของข้อความในปุ่ม
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      //3
      body: Column(
        children: [
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              onChanged: (value) =>
                  Provider.of<ThemeChange>(context, listen: false)
                      .toggleTheme(),
              value:
                  Provider.of<ThemeChange>(context, listen: false).isDarkMode,
            ),
          ),

          MySettingsTile(
            title: "Account Setting", 
            action: IconButton(
              onPressed: () => goAccountSettingPage(context),
              icon: Icon(Icons.settings),
            )
          )


        ],
      ),
    );
  }
}
