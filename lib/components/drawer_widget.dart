import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
            child: Image.asset('images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kbigSizedbox,
                GadgetText(gadgetName: 'SmartPhones'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Accesories'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Laptops'),
                kbigSizedbox,
                GadgetText(gadgetName: 'iMacs'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Inverter Air Conditioner'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Audio'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Tablets'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Smartwatches'),
                kbigSizedbox,
                GadgetText(gadgetName: 'Gaming'),
                kbigSizedbox,
                TextButton(
                    onPressed: () {
                      signUserOut();
                    },
                    child: Text('SignOut',
                    style: TextStyle(fontSize: 25),
                    ))
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
