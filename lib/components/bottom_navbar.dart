import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/favourite_screen.dart';
import 'package:oga_bassey/screens/home/components/home_screen_body.dart';

class CustomNavbar extends StatefulWidget {
  final void Function(int)? ontap;
  final int selectedIndex;
  const CustomNavbar({super.key, required this.ontap, required this.selectedIndex});

  @override
  State<CustomNavbar> createState() => _CostumNavbarState();
}

class _CostumNavbarState extends State<CustomNavbar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.commentDots), label: 'Chat'),
        ],
        currentIndex: widget.selectedIndex,
        onTap: widget.ontap);
  }
}
