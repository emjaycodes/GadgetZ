// ignore_for_file: prefer_const_constructors

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
        boxShadow: const [
      BoxShadow(
          color: kprimaryColor, //New
          blurRadius: 5.0,
          offset: Offset(-1,3))
    ],
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
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: const [
                Color(0xffEE5653),
                Color(0xffB5008D),
                Color(0xff5A03AC),
                Color(0xff003FAA)
                
              ],
            ),
           color: ktertiaryColor,
           borderRadius: BorderRadius.circular(8)
         ),
         child: Center(child: Text('Buy Now',
         style: TextStyle(
          color: ktertiaryColor,
         ),
         )),
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
