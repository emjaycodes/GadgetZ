// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/password_textfield.dart';
import 'package:oga_bassey/components/social_media_card.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/components/username_textfield.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login_screen.dart';
import 'package:oga_bassey/services/auth_services.dart';

import '../blocs/auth_bloc/authentication_bloc.dart';

final AuthService _authService = AuthService();

class SignupBody extends StatefulWidget {
  static String id = 'signup_screen';
  // final VoidCallback showLoginPage;
  const SignupBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController usernameController;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                kdivider,
                kbigSizedbox,
                // text that says create account
                Text('Create your account',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),

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
                    onPressed: () async {
                      context.read<AuthenticationBloc>().add(
                            SignUpUser(
                                emailController.text, passwordController.text),
                          );
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.id, (route) => false);
                    }

                    // try {
                    //   await authService.signUpUser(
                    //     emailController.text,
                    //     passwordController.text,
                    //   );

                    //   // Should only move to home screen if signup was successful.
                    //   if (mounted) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => HomeScreen(
                    //             username: usernameController.text),
                    //       ),
                    //     );
                    //   }
                    // } catch (e) {
                    //   // TODO: Extract SnackBar
                    //   UIUtils.showSnackBar(context, e.toString());
                    // }

                    ),

                kbigSizedbox,

                // row with divider with a text 'row'
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
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.id);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
