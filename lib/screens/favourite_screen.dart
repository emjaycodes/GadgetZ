import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  static String id = 'favourite_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FAVOURITE'),
      // ),
      body: const Center(
        child: Text("YOU HAVEN'T LIKED ANY ITEM" ),
      ),
    );
  }
}
