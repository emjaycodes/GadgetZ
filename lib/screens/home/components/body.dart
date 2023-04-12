// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
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
                    horizontalStackScroll(
                      gadgetType: 'Laptop',
                      productAmount: '40 Products', productImage: 'images/zen.png',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    horizontalStackScroll(
                      gadgetType: 'Laptop',
                      productAmount: '40 Products', productImage: 'images/zen.png',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    horizontalStackScroll(
                      gadgetType: 'Laptop',
                      productAmount: '40 Products', productImage: 'images/zen.png',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    horizontalStackScroll(
                      gadgetType: 'Laptop',
                      productAmount: '40 Products', productImage: 'images/zen.png',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    horizontalStackScroll(
                      gadgetType: 'Laptop',
                      productAmount: '40 Products', productImage: 'images/zen.png',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class horizontalStackScroll extends StatelessWidget {
  final String gadgetType;
  final String productAmount;
  final String productImage;
  const horizontalStackScroll({
    super.key,
    required this.gadgetType,
    required this.productAmount, required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
