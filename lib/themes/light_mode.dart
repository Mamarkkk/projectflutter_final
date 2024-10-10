import 'package:flutter/material.dart';



ThemeData lightMode = ThemeData(
  //colorScheme ใช้จัดชุดสี ให้uiสอดคล้องกัน
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,             //พื้นผิว เช่น card
    primary: Colors.grey.shade500,             //appbar or ปุ่มหลัก
    secondary: Colors.grey.shade200,           // ปุ่มรอง
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,      //ตรงข้าม primary ทำให้ชัดเจน
  )
);