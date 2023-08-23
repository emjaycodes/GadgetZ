
import 'package:flutter/material.dart';
import 'package:oga_bassey/components/horizontal_stack_scroll.dart';
import 'package:oga_bassey/theme/app_theme.dart';

class HorizontalListItem extends StatelessWidget {
   HorizontalListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.getThemeData(context).colorScheme;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
         const SizedBox(
          width: 10,
        ),
        HorizontalStackScroll(
          gadgetType:  Text(
            'Laptops',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themeData.tertiary,
            ),
          ),
          productAmount:  Text(
            '40 products',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.tertiary,
            ),
          ),
          productImage: 'images/zen.png',
        ),
         const SizedBox(
          width: 5,
        ),
        HorizontalStackScroll(
          gadgetType:  Text(
            'Smartphone',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themeData.tertiary,
            ),
          ),
          productAmount:  Text(
            '24 Products',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.tertiary,
            ),
          ),
          productImage: 'images/iphone.png',
        ),
         const SizedBox(
          width: 5,
        ),
        HorizontalStackScroll(
       
          gadgetType:  Text(
            'Smartphone',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themeData.tertiary,
            ),
          ),
          productAmount:  Text(
            '24 Products',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.tertiary,
            ),
          ),
          productImage: 'images/iphone.png',
        ),
         const SizedBox(
          width: 5,
        ),
        HorizontalStackScroll(
      
          gadgetType:  Text(
            'Laptops',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themeData.tertiary,
            ),
          ),
          productAmount:  Text(
            '24 Products',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.tertiary,
            ),
          ),
          productImage: 'images/zen.png',
        ),
         const SizedBox(
          width: 5,
        ),
        HorizontalStackScroll(
          gadgetType:  Text(
            'Laptop',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themeData.tertiary,
            ),
          ),
          productAmount:  Text(
            '50 Products',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.tertiary,
            ),
          ),
          productImage: 'images/zen.png',
        ),
      ],
    );
  }
}
