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
                  onPressed: (){}, icon:
                 Icon(Icons.search)
                 ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: ktertiaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
          ),
        ),

        ksmallSizedbox,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFDE6E7)
              ),
              height: 52,
              width: 356,
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                  children: [ 
                     Icon(Icons.assignment_late_outlined
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Complete your profile, add delivery details'),

                     IconButton(onPressed: (){},
                     icon: Icon(Icons.assignment_late_outlined
                    ) ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}