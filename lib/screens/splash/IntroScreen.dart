
import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';

import 'package:oga_bassey/screens/login_screen.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'splash_screen';

  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
              left: 50,
              top: 100,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kprimaryColor,
                ),
                child: Image.asset(
                  'images/iphonefb.png',
                ),
              )),
          Positioned(
              right: 30,
              top: 100,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kprimaryColor,
                ),
                child: Image.asset(
                  'images/ipad.png',
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 2 - 100,
              left: MediaQuery.of(context).size.width / 2 - 100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kprimaryColor,
                ),
                child: Image.asset('images/zenpro.png'),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 200,
            left: MediaQuery.of(context).size.width / 2 - 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Find the latest &',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'stylish gadget',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimaryColor,
                    foregroundColor: Colors.white,
                    shadowColor: kprimaryColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: ktertiaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
