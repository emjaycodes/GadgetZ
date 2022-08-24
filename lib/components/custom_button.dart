import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomButtom({required this.buttonName, required this.buttonColor, required this.textStyle, required this.onPressed});
  
  final String buttonName;
  final Color buttonColor;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        fixedSize: const Size(300, 50)
         ),
         
      onPressed: widget.onPressed,
   child: Text(widget.buttonName,
  style: widget.textStyle,
      )
        );
  }
}