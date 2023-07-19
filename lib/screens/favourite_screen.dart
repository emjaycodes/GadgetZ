import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';

import '../constants.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  static String id = 'favourite_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LikedProductBloc, LikedProductState>(
        builder: (context, state) {
          if (state is LikeProductLoadedState) {
            final likedItems = state.likedProductList;
            if (likedItems.isEmpty) {
              return const Text("YOU HAVE'NT ADDED ANY ITEM TO CART");
            }
            return GridView.builder(
                itemCount: likedItems.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3.5,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  final likeItem = likedItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:  BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: ktertiaryColor
                            ),
                          ),
                          ksmallSizedbox,
                          Text(likeItem.name,
                          style: const TextStyle(
                            color: ktertiaryColor,
                            fontSize: 15
                          ),
                          ),
                          ksmallSizedbox,
                          Text(likeItem.price.toString(),
                          style: const TextStyle(
                            color: ktertiaryColor,
                            fontSize: 15
                          ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
            // return ListTile(
            //     title: Text(likeItem.name),
            //     subtitle: Text('Price: ${likeItem.price}'));
          } else {
            return const Center(
              child: Text("YOU HAVE'NT ADDED ANY ITEM TO CART"),
            );
          }
        },
      ),
    );
  }
}
