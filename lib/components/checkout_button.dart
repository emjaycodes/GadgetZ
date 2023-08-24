import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_cubit/theme_cubit.dart';
import '../constants.dart';
import '../size_cofig.dart';
import '../theme/app_theme.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.buttonText,
    this.ontap,
  });

  final String buttonText;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
     final themeData = AppTheme.getThemeData(context);
    final buttonColor = themeData.colorScheme.primary;
    // final textColor = themeData.colorScheme.tertiary;
        return InkWell(
          onTap: ontap,
          child: Container(
            height: SizeConfig.screenHeight / 16,
            width: SizeConfig.screenWidth * 0.7,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                buttonText,
                style:  TextStyle(
                  color: themeData.colorScheme.secondary,
                ),
              ),
            ),
          ),
        );
  }
    
  }

