// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/components/product_container.dart';
import 'package:oga_bassey/constants.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final List<Widget> productCard = [
    ProductContainer(productName: 'proArt StudioBook',
     productbrand: 'Azus', productPrice: '\$2338,1', productImage: 'images/Asus.png'),
      ProductContainer(
              productName: 'proArt StudioBook',
              productbrand: 'Azus',
              productPrice: '\$2338,1',
              productImage: 'images/zen2.png',
            ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
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
                  width: 15,
                ),
                HorizontalStackScroll(
                  gadgetType: 'Laptop',
                  productAmount: '40 Products',
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  gadgetType: 'Laptop',
                  productAmount: '40 Products',
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  gadgetType: 'Laptop',
                  productAmount: '40 Products',
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  gadgetType: 'Laptop',
                  productAmount: '40 Products',
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  gadgetType: 'Laptop',
                  productAmount: '40 Products',
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
              padding: const EdgeInsets.all(10.0),
              child: Text('Popular Product'),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('See all'),
            ),
          ],
        ),
        kbigSizedbox,

        // Expanded(
        //     child: ListView.builder(
        //         itemCount: productCard.length,
        //         itemBuilder: (context, index) {
        //           return Row(
        //             children: [
        //               productCard[index],
                      
        //             ],
        //           );
        //         })),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProductContainer(
              productName: 'proArt StudioBook',
              productbrand: 'Azus',
              productPrice: '\$2338,1',
              productImage: 'images/Asus.png',
            ),
            ProductContainer(
              productName: 'proArt StudioBook',
              productbrand: 'Azus',
              productPrice: '\$2338,1',
              productImage: 'images/zen2.png',
            ),
          ],
        ),
      ],
    );
  }
}


class HorizontalStackScroll extends StatelessWidget {
  final String gadgetType;
  final String productAmount;
  final String productImage;
  const HorizontalStackScroll({
    super.key,
    required this.gadgetType,
    required this.productAmount,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 60,
        width: 140,
        decoration: BoxDecoration(
            color: kprimaryColor, borderRadius: BorderRadius.circular(15)),
      ),
      Positioned(
        left: 60,
        bottom: 43,
        child: Text(
          gadgetType,
          style: TextStyle(
            color: ktertiaryColor,
          ),
        ),
      ),
      Positioned(
        left: 55,
        bottom: 24,
        child: Text(
          productAmount,
          style: TextStyle(
            color: ktertiaryColor,
          ),
        ),
      ),
      Positioned(
        left: 10,
        bottom: 21,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: ktertiaryColor, borderRadius: BorderRadius.circular(8)),
          child: Center(child: Image.asset(productImage)),
        ),
      )
    ]);
  }
}
