import 'package:flutter/material.dart';
import 'package:oga_bassey/theme/app_theme.dart';
import '../constants.dart';

// ignore: must_be_immutable
class HorizontalStackScroll extends StatelessWidget {
  final Text gadgetType;
  final Text productAmount;
  final String productImage;

  HorizontalStackScroll({
    super.key,
    required this.gadgetType,
    required this.productAmount,
    required this.productImage,
    
  });

  bool istapped = true;

  void toggleColour() {
    istapped = !istapped;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.getThemeData(context).colorScheme;
    return Stack(children: [
      GestureDetector(
        onTap: toggleColour,
        child: Container(
          height: 60,
          width:  155,
          decoration: BoxDecoration(
              color:istapped ? themeData.primaryContainer : themeData.secondaryContainer, 
              borderRadius: BorderRadius.circular(15)),
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
