import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/constants.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  static String id = 'cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartloadedState) {
          final cartItems = state.cartlist;
          if (cartItems.isEmpty) {
            return const Text("YOU HAVE'NT ADDED ANY ITEM TO CART");
          }
          return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 200,
                    color: Colors.amber,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          color: kprimaryColor,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(cartItem.name),
                            Text('Price: ${cartItem.price}'),
                            const Row(
                              children: [
                                CartButton(
                                  cartIcon: Icon(Icons.add),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('1'),
                                SizedBox(
                                  width: 10,
                                ),
                                CartButton(
                                  cartIcon: Icon(Icons.remove),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );

                // return ListTile(
                //     title: Text(cartItem.name),
                //     subtitle: Text('Price: ${cartItem.price}'));
              });
        } else {
          return const Center(
            child: Text("YOU HAVE'NT ADDED ANY ITEM TO CART"),
          );
        }
      },
    ));
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.cartIcon,
  });

  final Icon cartIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: ktertiaryColor,
            // shape: BoxShape.circle
            borderRadius: BorderRadius.circular(20)),
        child: cartIcon);
  }
}
