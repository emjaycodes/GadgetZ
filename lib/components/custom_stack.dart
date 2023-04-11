import 'package:flutter/material.dart';

import '../constants.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
     fit: StackFit.loose,
     clipBehavior: Clip.none,
     
    children: [
     Container(
       height: 180,
       width: 300,
       decoration: BoxDecoration(
         color: kprimaryColor,
         borderRadius: BorderRadius.circular(20)
       ),
     ),
     Positioned(
       top: 20,
       left: 20,
       child: Text('Zenbook Dou',
       style: TextStyle(
         color: ktertiaryColor,
       ),
       ),
     ),
     Positioned(
       top: 50,
       left: 20,
       child: Text('Unbelievable visual',
       style: TextStyle(
         color: ktertiaryColor,
       ),
       ),
     ),
      Positioned(
       top: 70,
       left: 20,
       child: Text('& perfomance',
       style: TextStyle(
         color: ktertiaryColor,
       ),
       ),
     ),

     Positioned(
       top: 110,
       left: 20,
       child: Container(
         height: 36,
         width: 100,
         decoration: BoxDecoration(
           color: ktertiaryColor,
           borderRadius: BorderRadius.circular(8)
         ),
         child: Center(child: Text('Buy Now')),
       ),
     ),
    Positioned(
     left: 105,
     bottom: 2,
     child:  Container(
       height: 170,
       width: 250,
       decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('images/zen.png'),
             fit: BoxFit.cover,
             )
       ),
     ),)
    ],
    );
  }
}
