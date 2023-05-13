import 'package:flutter/material.dart';

class FullnameTextfield extends StatefulWidget {
  const FullnameTextfield({
    Key? key, required TextEditingController usernameController,
  }) : super(key: key);

  @override
  State<FullnameTextfield> createState() => _FullnameTextfieldState();
}

class _FullnameTextfieldState extends State<FullnameTextfield> {
  final usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
              // border: InputBorder.none
              ),
        ),
      ),
    );
  }
}
