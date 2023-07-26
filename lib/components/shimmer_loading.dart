import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatefulWidget {
  const ShimmerList({super.key});

  @override
  State<ShimmerList> createState() => _ShimmeerListState();
}

class _ShimmeerListState extends State<ShimmerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: const ShimmerLayoyt());
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
          childAspectRatio: 1 / 1.7,
        ),
      ),
    );
  }
}

class ShimmerLayoyt extends StatefulWidget {
  const ShimmerLayoyt({super.key});

  @override
  State<ShimmerLayoyt> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShimmerLayoyt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
              ksmallSizedbox,
              Container(
                height: 20,
                width: 120,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
              ksmallSizedbox,
              Container(
                height: 20,
                width: 100,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
              ksmallSizedbox,
              Container(
                height: 20,
                width: 100,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ]),
      ),
    );
  }
}
