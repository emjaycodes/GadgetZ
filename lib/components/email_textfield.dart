


import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final emailController;
  

  const EmailTextfield({
    Key? key,
    this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))
                // border: InputBorder.none
                ),
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null),
      ),
    );
  }
}