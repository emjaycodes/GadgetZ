// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oga_bassey/components/bottom_navbar.dart';
import 'package:oga_bassey/components/drawer_widget.dart';
import 'package:oga_bassey/constants.dart';

import 'components/product_body.dart';



class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static String id = 'product_screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              'Popular Product',
              style: TextStyle(color: kprimaryColor),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kprimaryColor,
              ),
            onPressed: (){},
            ),
            
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
        body: ProductBody(),
        bottomNavigationBar: CustomNavbar());
  }
}
