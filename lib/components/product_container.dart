import 'package:flutter/material.dart';

import '../constants.dart';

class ProductContainer extends StatelessWidget {
  final String productName;
  final String productbrand;
  final double productPrice;
  final String productImage;
  final void Function()? ontap;

  const ProductContainer({
    super.key,
    required this.productName,
    required this.productbrand,
    required this.productPrice,
    this.ontap,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 270,
        width: 150,
        decoration: BoxDecoration(
            color: ktertiaryColor, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                productImage,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  // Handle the error here, for example, by showing a placeholder image
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red), // Error icon
                      Text('Failed to load image'), // Custom error message
                    ],
                  ); // Change this to your desired error handling mechanism
                },
              ),
              // Image.network(productImage)
            ),
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
                    Text(
                      productName,
                      style: const TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // ksmallSizedbox,
                    Text(
                      productbrand,
                      style: const TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productPrice.toString(),
                          style: const TextStyle(
                            color: kprimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: ktertiaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
