import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

bool hidePassword = true;

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    Key? key,
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
          obscureText: hidePassword,
         decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: (){
              setState(() {
                if (hidePassword = true) {
                  hidePassword = false;
                }
              });
            },
          ),
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
           // border: InputBorder.none
         ),
         validator: (value){
          if(value != null && value.length < 7){
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

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
         decoration: InputDecoration(
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
           // border: InputBorder.none
         ),
         validator: (email)=>  
         email != null && !EmailValidator.validate(email)
         ? 'Enter a valid email'
         : null
        ),
      ),
    );
  }
}


class FullnameTextfield extends StatelessWidget {
  const FullnameTextfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: 339,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
         decoration: InputDecoration(
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
           // border: InputBorder.none
         ),
        ),
      ),
    );
  }
}