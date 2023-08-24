
import 'package:flutter/material.dart';

import '../constants.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    super.key,
    required this.cartIcon,
    required this.ontap,
  });

  final Icon cartIcon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: ktertiaryColor,
              // shape: BoxShape.circle
              borderRadius: BorderRadius.circular(20)),
          child: cartIcon),
    );
  }
}
