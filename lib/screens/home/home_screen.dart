// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/cart_screen.dart';
import 'package:oga_bassey/screens/home/components/home_screen_body.dart';
import '../../components/drawer_widget.dart';
import '../favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.username = ''}) : super(key: key);

  static String id = 'home_screen';
  final String username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  late int selectedIndex = 0;

  // SCREEN LIST
  final List screens = [
    HomeBody(),
    FavouriteScreen(),
    CartScreen(),
  ];

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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.id);
                },
                icon: Icon(
                  FontAwesomeIcons.bagShopping,
                  color: kprimaryColor,
                )),
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kprimaryColor),
      ),
      drawer: CustomDrawer(),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kprimaryColor,
        unselectedItemColor: ktertiaryColor,
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart), label: 'Like'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bagShopping), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
    // CustomNavbar(ontap: (selectedIndex ) {
    //   setState(() {
    //     selectedIndex = index;
    //   });
    //   },
    // selectedIndex: selectedIndex,));
  }
}
