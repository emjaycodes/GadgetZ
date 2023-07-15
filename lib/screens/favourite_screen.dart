import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';

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
          return ListView.builder(
            itemCount: likedItems.length,
            itemBuilder: (context, index) {
            final likeItem = likedItems[index];
            
            return ListTile(
                title: Text(likeItem.name),
                subtitle: Text('Price: ${likeItem.price}'));
          });
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
