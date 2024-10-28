import 'package:flutter/material.dart';
import 'package:project1/screens/account_setting_page.dart';

void goAccountSettingPage (BuildContext context) {

  Navigator.push(
    context, 
    MaterialPageRoute(builder: (context)=> AccountSettingPage())
  );
}