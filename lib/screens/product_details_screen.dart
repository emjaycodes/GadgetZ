// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/cart_bloc/cart_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/size_cofig.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // bool isliked = false;
    SizeConfig().init(context);
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
              height: SizeConfig.screenHeight / 2.5,
              width: SizeConfig.screenWidth * 0.9,
              decoration: BoxDecoration(
                  color: ktertiaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                product.image,
                // height: 100.0,width: 50.0,
              ),
            ),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      color: kprimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(color: kprimaryColor, fontSize: 25),
                ),
              ],
            ),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
              'Description',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 120,
              width: 600,
              child: Text(
                product.description,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<LikedProductBloc>(context).add(
                      LikeProductEvent(product, product.liked),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: kprimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: product.liked == true
                        ? const Icon(Icons
                            .favorite) // Icon to show when product.liked is true
                        : const Icon(Icons.favorite_border),
                  ),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(AddToCartEvent(product));
                  },
                  child: Container(
                    height: SizeConfig.screenHeight / 16,
                    width: SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: ktertiaryColor,
                        ),
                      ),
                    ),
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
