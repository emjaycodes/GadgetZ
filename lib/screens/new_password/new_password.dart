import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'components/body.dart';
// import 'package:oga_bassey/screens/welcome.dart';
// import 'package:oga_bassey/components/custom_text_input_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  static String id = 'New_password';

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar with a button arrow back button
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(
              //   context,
              // );
            },
            icon: const Icon(
              Icons.navigate_before,
              color: ksecondaryTextColor,
              size: 40,
            )),
      ),

      body: const Body(),
    );
  }
}
