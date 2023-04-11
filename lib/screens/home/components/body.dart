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
    return Column(
      children: [
        ksmallSizedbox,
       Center(
         child: CustomStackWidget(),
       ),
       
       
      ],
    );
  }
}

