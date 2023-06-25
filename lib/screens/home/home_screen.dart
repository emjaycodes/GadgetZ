// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oga_bassey/components/bottom_navbar.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/home/components/home_screen_body.dart';
import '../../components/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.username = ''}) : super(key: key);

  static String id = 'home_screen';

  final user = FirebaseAuth.instance.currentUser!;

  final int selectedIndex = 0;

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Hi there',
            style: TextStyle(color: kprimaryColor),
          ),
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.segment_outlined,
          //     color: kprimaryColor,
          //     ),
          //   onPressed: (){},
          //   ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                FontAwesomeIcons.bagShopping,
                color: kprimaryColor,
              ),
            )
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: kprimaryColor),
        ),
        drawer: CustomDrawer(),
        body: HomeBody(),
        bottomNavigationBar: CustomNavbar());
  }
}
