// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

bool hidePassword = true;



class PasswordTextfield extends StatefulWidget {
final passwordController;

  PasswordTextfield({
    Key? key,
    this.passwordController,
  }) : super(key: key);

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: widget.passwordController,
          obscureText: hidePassword,
          decoration: InputDecoration(
              suffixIcon: 
                  GestureDetector(
                  child: Icon(Icons.remove_red_eye_outlined),
                  onTap: () {
                  setState(() {
                    if (hidePassword = false) {
                      hidePassword = true;
                    }
                  });
                },
                  ),
                
              
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
