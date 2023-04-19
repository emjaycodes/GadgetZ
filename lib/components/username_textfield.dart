import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FullnameTextfield extends StatelessWidget {
  final usernameController;
  const FullnameTextfield({
    Key? key, this.usernameController,
  }) : super(key: key);

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
