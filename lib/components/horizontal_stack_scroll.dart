import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class HorizontalStackScroll extends StatelessWidget {
  final Text gadgetType;
  final Text productAmount;
  final String productImage;
  final Function()? ontap;
  final Color activeColor;

  HorizontalStackScroll({
    super.key,
    required this.gadgetType,
    required this.productAmount,
    required this.productImage,
    this.ontap,
    required this.activeColor,
  });

  bool istapped = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: ontap,
        child: Container(
          height: 60,
          width:  155,
          decoration: BoxDecoration(
              color: activeColor, borderRadius: BorderRadius.circular(15)),
        ),
      ),
      Positioned(
        left: 60,
        bottom: 40,
        child: gadgetType,
      ),
      Positioned(
        left: 55,
        bottom: 20,
        child: productAmount
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
