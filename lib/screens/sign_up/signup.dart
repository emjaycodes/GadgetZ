import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'components/body.dart';
import 'package:oga_bassey/screens/welcome.dart';
import 'package:oga_bassey/components/custom_text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static String id = 'signup_screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appbar with a button arrow back button
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.navigate_before,
            color: ksecondaryTextColor,
            size: 40,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
