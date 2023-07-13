// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/cart_bloc/cart_bloc.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: kprimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ksmallSizedbox,
          Center(
            child: Container(
              height: 300,
              width: 390,
              decoration: const BoxDecoration(
                color: kprimaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: const Text('Description'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: kprimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: const Icon(Icons.favorite, color: kprimaryColor,) ,
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context).add(AddToCartEvent(product));
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(child: Text('Add to cart', style: TextStyle(
                      color: ktertiaryColor,
                    ),),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
