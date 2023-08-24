// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oga_bassey/blocs/theme_cubit/theme_cubit.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/cart_screen.dart';
import 'package:oga_bassey/screens/home/components/home_screen_body.dart';
import 'package:oga_bassey/theme/app_theme.dart';
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
    final themeData = AppTheme.getThemeData(context).colorScheme;
    return BlocBuilder<ThemeCubit, ThemeModeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: themeData.background,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Hi there',
              style: TextStyle(color: themeData.tertiary ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                  icon: Icon(Icons.lightbulb),
                  color: themeData.tertiary,
                ),
              )
            ],
            iconTheme: IconThemeData(color: themeData.tertiary),
          ),
          drawer: CustomDrawer(),
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: themeData.background,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: themeData.tertiary,
            unselectedItemColor: themeData.tertiary,
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
      },
    );
  }
}
