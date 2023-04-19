import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool hidePassword = false;



class PasswordTextfield extends StatelessWidget {
final passwordController;

  PasswordTextfield({
    Key? key,
    this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: passwordController,
          obscureText: hidePassword,
          decoration: InputDecoration(
              suffixIcon: 
                  Icon(Icons.remove_red_eye_outlined),
                // onPressed: () {
                //   setState(() {
                //     if (hidePassword = true) {
                //       hidePassword = false;
                //     }
                //   });
                // },
              
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
              // border: InputBorder.none
              ),
          validator: (value) {
            if (value != null && value.length < 7) {
              return 'Enter min. 6 Characters'; //
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
