import 'package:flutter/material.dart';

class MyBio extends StatelessWidget{
    final String text;
    const MyBio ({super.key, required this.text});


    @override
    Widget build(BuildContext context) {


        return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
            ),

            padding: const EdgeInsets.all(25),
            
            child: Text(
                text.isNotEmpty ? text: "Empty bio...", 
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        );
    }











}