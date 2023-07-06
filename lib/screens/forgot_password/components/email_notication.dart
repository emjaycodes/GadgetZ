import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/login_screen.dart';


class EmailNotifierScreen extends StatefulWidget {
  const EmailNotifierScreen({Key? key}) : super(key: key);

  static String id = 'email_notifier';

  @override
  State<EmailNotifierScreen> createState() => _EmailNotifierScreenState();
}

class _EmailNotifierScreenState extends State<EmailNotifierScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.of(context).pushReplacementNamed(LoginScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) =>  LoginScreen()),
              );
            },
            icon: const Icon(
              Icons.navigate_before,
              color: ksecondaryTextColor,
              size: 40,
            )),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            kbigSizedbox,
            CircleAvatar(
                maxRadius: 60, backgroundImage: AssetImage('images/email.png')),
            kbigSizedbox,
            //text
            Text(
              'We have sent password recover information to your email.Didn\'t recieve it, check spam',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ksecondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
