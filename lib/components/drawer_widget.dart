import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/auth_bloc/authentication_bloc.dart';
import 'package:oga_bassey/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ktertiaryColor,
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kprimaryColor,
            ),
            child: Row(
              children: const [
                Text(
                  'G',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'ADGE',
                  style: TextStyle(
                    color: ktertiaryColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'TZ',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
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
                      child: const Text(
                        'SignOut',
                        style: TextStyle(color: kprimaryColor, fontSize: 21),
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

class GadgetText extends StatelessWidget {
  const GadgetText({
    Key? key,
    required this.gadgetName,
  }) : super(key: key);

  final String gadgetName;

  @override
  Widget build(BuildContext context) {
    return Text(
      gadgetName,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: kprimaryColor,
      ),
    );
  }
}
