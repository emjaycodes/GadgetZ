// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/password_textfield.dart';
import 'package:oga_bassey/components/utils.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/components/username_textfield.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/components/social_media_card.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login_body.dart';
import 'package:oga_bassey/services/auth_services.dart';


class SignupBody extends StatefulWidget {
  static String id = 'signup_screen';
  // final VoidCallback showLoginPage;
  const SignupBody({Key? key,}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future signUp() async {
    // final isvalid = formkey.currentState!.validate();
    // if (!isvalid) return;

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
       Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    emailController.dispose();
    passwordController.dispose();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              kdivider,
              kbigSizedbox,
              // text that says create account
              Text('Create your account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
    
              kbigSizedbox,
              TextfieldName(
                text: 'Full name',
              ),
    
              //textfield
    
              FullnameTextfield(
                usernameController: usernameController,
              ),
    
              SizedBox(
                height: 20,
              ),
    
              // that says email
              TextfieldName(
                text: 'Email address',
              ),
              SizedBox(
                height: 10,
              ),
              // textfield
              EmailTextfield(
                emailController: emailController,
              ),
              kbigSizedbox,
              // text that says passsword
              TextfieldName(
                text: 'Password',
              ),
              ksmallSizedbox,
              // textfield with icon
              PasswordTextfield(
                passwordController: passwordController,
              ),
    
              kbigSizedbox,
    
              // sign up buttun
              CustomButtom(
                  buttonName: 'Signup',
                  buttonColor: kdisabledButtonColor,
                  textStyle: ksignupbuttonTextStyle(),
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    signUp();
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(username: usernameController.text)));
                  }),
    
              kbigSizedbox,
    
              // row wit divder with a text 'row'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 7,
                        width: 169,
                        child: Divider(
                          thickness: 4,
                          color: Color(0xFFF5F5F5),
                          // indent: 1,
                          endIndent: 10,
                        )),
                  ),
    
                  // SizedBox(width: 45),
                  // text 'or'
                  Text('OR'),
    
                  Expanded(
                    child: SizedBox(
                        height: 7,
                        width: 175,
                        child: Divider(
                          thickness: 5,
                          color: Color(0xFFF5F5F5),
                          indent: 10,
                        )),
                  ),
                ],
              ),
    
              kbigSizedbox,
              //row with three svg buttons
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaCard(
                      onTap: () {
                      AuthService().signInWithGoogle();
                    },
                      socialImage: AssetImage('images/google.png'),
                    ),
                    SocialMediaCard(
                      socialImage: AssetImage('images/apple.png'),
                    ),
                    SocialMediaCard(
                      socialImage: AssetImage('images/facebook.png'),
                    )
                  ],
                ),
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kprimaryColor,
                        ),
                      ),
                      onTap: () {
                        // widget.showLoginPage;
                        // Navigator.pop(context);
                         Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
