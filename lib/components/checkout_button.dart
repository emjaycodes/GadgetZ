import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_cofig.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key, required this.buttonText, this.ontap,
  });

  final String buttonText;
  final void Function()? ontap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: 
       ontap,
      child: Container(
        height: SizeConfig.screenHeight / 16,
        width: SizeConfig.screenWidth * 0.7,
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: ktertiaryColor,
            ),
          ),
        ),
      ),
    );
  }
}