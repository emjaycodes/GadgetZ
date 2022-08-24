import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';


class TextfieldName extends StatelessWidget {

  // ignore: use_key_in_widget_constructors
  const TextfieldName({ required this.text, });

  final String text;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
        Text( text,
      style: textboxNameStyle(),
      ),
        ],
      ),
    );
  }
}