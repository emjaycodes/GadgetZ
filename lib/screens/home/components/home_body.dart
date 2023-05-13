// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/components/horizontal_stack_scroll.dart';
import 'package:oga_bassey/components/product_container.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/product_screen/components/product_body.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // final List<Widget> productCard = [
  bool istapped = true;

  void toggleColour() {
    if (istapped == true) {
      istapped == false;
    }
  }

  void toggleColourBack() {
    if (istapped == false) {
      istapped == true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ksmallSizedbox,
          Center(
            child: CustomStackWidget(),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  HorizontalStackScroll(
                    activeColor:
                        kprimaryColor,
                    ontap: () {
                      setState(() {
                        toggleColour();
                        print(toggleColour);
                      });
                    },
                    
                    gadgetType: Text( 'Laptops',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ktertiaryColor,
                    ),
                    ),
                    productAmount: Text( '40 products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ktertiaryColor,
                    ),
                    ),
                    productImage: 'images/zen.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  HorizontalStackScroll(
                    ontap: () {
                      toggleColourBack();
                      print(istapped);
                    },
                    activeColor:
                         ktertiaryColor,
                    gadgetType: Text( 'Smartphone',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                    ),
                    productAmount: Text( '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                    ),
                    productImage: 'images/iphone.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  HorizontalStackScroll(
                    activeColor:
                         ktertiaryColor,
                    gadgetType: Text( 'Smartphone',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                    ),
                    productAmount: Text( '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                    ),
                    productImage: 'images/iphone.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  HorizontalStackScroll(
                    activeColor:
                         ktertiaryColor,
                    gadgetType: Text( 'Laptops',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                    ),
                    productAmount: Text( '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                    ),
                    productImage: 'images/zen.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  HorizontalStackScroll(
                    activeColor:
                        istapped == true ? kprimaryColor : ktertiaryColor,
                    
                    gadgetType: Text( 'Laptop',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ktertiaryColor,
                    ),
                    ),
                    productAmount: Text( '50 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ktertiaryColor,
                    ),
                    ),
                    productImage: 'images/zen.png',
                  ),
                ],
              ),
            ),
          ),
          kbigSizedbox,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  'Popular Product',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kprimaryColor,
                  ),
                  ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ProductBody.id);
                  },
                  child: Text('See all',
                  style: TextStyle(
                  ),
                  )),
              ),
            ],
          ),
          kbigSizedbox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductContainer(
                productName: 'proArt StudioBook',
                productbrand: 'Azus',
                productPrice: '\$2338,1',
                productImage: 'images/asus.png',
              ),
              ProductContainer(
                productName: 'Zenbook Duo',
                productbrand: 'Azus',
                productPrice: '\$1272,2',
                productImage: 'images/zen2.png',
              ),
            ],
          ),
          kbigSizedbox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductContainer(
                productName: 'ZenBook Pro Duo',
                productbrand: 'Azus',
                productPrice: '\$2338,1',
                productImage: 'images/asus.png',
              ),
              ProductContainer(
                productName: 'Macbook pro',
                productbrand: 'Apple',
                productPrice: '\$2338,1',
                productImage: 'images/macbook.png',
              ),
            ],
          ),
          kbigSizedbox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductContainer(
                productName: 'proArt StudioBook',
                productbrand: 'Azus',
                productPrice: '\$3096,97  ',
                productImage: 'images/zenpro.png',
              ),
              ProductContainer(
                productName: 'Macbook Pro',
                productbrand: 'Apple',
                productPrice: '\$2338,1',
                productImage: 'images/macbook.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

