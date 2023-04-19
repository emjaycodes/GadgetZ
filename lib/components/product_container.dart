import 'package:flutter/material.dart';

import '../constants.dart';


class ProductContainer extends StatelessWidget {
  final String productName;
  final String productbrand;
  final String productPrice;
  final String productImage;

  const ProductContainer({
    super.key,
    required this.productName,
    required this.productbrand,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 150,
      decoration: BoxDecoration(
          color: ktertiaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.asset(productImage),
          Container(
            height: 110,
            width: 135,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksmallSizedbox,
                  Text(productName),
                  // ksmallSizedbox,
                  Text(productbrand),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productPrice),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: ktertiaryColor,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
