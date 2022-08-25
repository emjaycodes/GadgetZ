// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      elevation: 0,
      title: Text('Hi Bassey',
      style: TextStyle(
        color: kprimaryColor
      ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.segment_outlined,
          color: kprimaryColor,
          ),
        onPressed: (){},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: kprimaryColor,
              ),
          )
        ],
        backgroundColor: Colors.white,
     ),
     body: Body()
    );
  }
}