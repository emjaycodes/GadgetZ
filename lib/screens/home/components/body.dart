// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart'; 


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kbigSizedbox,
        TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: kprimaryColor,
              ),
              
              border: OutlineInputBorder(
                // borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100)
              )
            ),
        ),
      ],
    );
  }
}