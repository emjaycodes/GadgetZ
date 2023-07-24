import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';
import '../constants.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  static String id = 'favourite_screen';

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: BlocBuilder<LikedProductBloc, LikedProductState>(
        builder: (context, state) {
          if (state is LikeProductLoadedState) {
            final likedItems = state.likedProductList;
            if (likedItems.isEmpty) {
              return const Text("YOU HAVE'NT LIKED ANY ITEM ");
            }
            return GridView.builder(
                itemCount: likedItems.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2.5 / 3.7,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: SizeConfig.screenHeight * 0.2,
                              width: SizeConfig.screenWidth * 0.4,
                              decoration:  BoxDecoration(
                                color: ktertiaryColor,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Image.network(likeItem.image),
                            ),
                          ),
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
          } else {
            return const Center(
              child: Text(" YOU HAVE'NT LIKED ANY ITEM "),
            );
          }
        },
      ),
    );
  }
}
