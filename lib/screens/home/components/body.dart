// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import '../../../size_cofig.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        kbigSizedbox,
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    color: Color(0xFF7F90A0),
                    onPressed: () {},
                    icon: Icon(Icons.search)),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: ktertiaryColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        ksmallSizedbox,
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFDE6E7)),
              height: 52,
              width: 386,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Icon(
                        color: Color(0xFFE63232),
                        Icons.assignment_late_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Complete your profile, add delivery details',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    IconButton(
                        color: Color(0xFFE63232),
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel_outlined,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        kbigSizedbox,
        Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFF54BA99)),
            width: 400,
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Image.asset('images/caro.png'),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120.0, vertical: 50),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('Let\'s Get Started'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 90),
            child: Text(
              'Want to pay in installments?',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ],
    );
  }
}
