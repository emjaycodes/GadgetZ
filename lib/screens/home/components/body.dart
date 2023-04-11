// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            ksmallSizedbox,
            Center(
              child: CustomStackWidget(),
            ),
            kbigSizedbox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children :[
                        Container(
                        height: 60,
                        width: 130,
                        decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Text('Laptop'),
                      Text('40 Products')
                      ]
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
