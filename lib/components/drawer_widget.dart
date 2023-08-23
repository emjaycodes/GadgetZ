import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/auth_bloc/authentication_bloc.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/theme/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.getThemeData(context).colorScheme;
    return Drawer(
      backgroundColor: themeData.background,
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kprimaryColor,
            ),
            child: AppLogo(size: 50, fontWeight: FontWeight.w700,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kbigSizedbox,
                const GadgetText(gadgetName: 'SmartPhones'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Accesories'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Laptops'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'iMacs'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Inverter Air Conditioner'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Audio'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Tablets'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Smartwatches'),
                kbigSizedbox,
                const GadgetText(gadgetName: 'Gaming'),
                kbigSizedbox,
                Center(
                  child: TextButton(
                      onPressed: () {
                        //sign out
                        context.read<AuthenticationBloc>().add(SignOutUser());
                      },
                      child:  Text(
                        'SignOut',
                        style: TextStyle(color: themeData.tertiary, fontSize: 21),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  final double size;
  final FontWeight? fontWeight;
  const AppLogo({
    super.key, required this.size, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      child: Row(
        children: [
          Text(
            'G',
            style: TextStyle(
              color: Colors.blue,
              fontSize: size,
              fontWeight: fontWeight,
            ),
          ),
          Text(
            'ADGE',
            style: TextStyle(
              color: ktertiaryColor,
              fontSize: size,
              fontWeight: fontWeight,
            ),
          ),
          Text(
            'TZ',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: size,
              fontWeight: fontWeight,
            ),
          )
        ],
      ),
    );
  }
}

class GadgetText extends StatelessWidget {
  const GadgetText({
    Key? key,
    required this.gadgetName,
  }) : super(key: key);

  final String gadgetName;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.getThemeData(context).colorScheme;
    return Text(
      gadgetName,
      style:  TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: themeData.tertiary,
      ),
    );
  }
}
