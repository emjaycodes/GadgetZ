import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_cubit/theme_cubit.dart';
import '../constants.dart';
import '../size_cofig.dart';

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
    return BlocBuilder<ThemeCubit, ThemeModeState>(
      builder: (context, state) {
         final themeMode = state.themeMode;
        final buttonColor = themeMode == ThemeMode.dark
            ? ktertiaryColor
            : kprimaryColor;
            
      final textColor = themeMode == ThemeMode.dark
            ? kprimaryColor
            : ktertiaryColor;

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
                  color: textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
