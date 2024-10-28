import 'package:flutter/material.dart';

class MySettingsTile extends StatelessWidget {
  final String title;
  final Widget action;

  const MySettingsTile({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      //คุลุมด้วยcontainer แล้วใส่กล่องคลุม switch dark-light mode
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        //ทำให้มุมไม่แหลม curve
        borderRadius: BorderRadius.circular(12),
      ),

      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),

      padding: const EdgeInsets.all(25),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          action,
        ],
      ),
    );
  }
}
