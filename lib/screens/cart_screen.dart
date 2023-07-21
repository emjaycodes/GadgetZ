import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/constants.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../components/cart_icon_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

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
                    decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                                color: ktertiaryColor,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cartItem.name,
                              style: const TextStyle(
                                color: ktertiaryColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              cartItem.price.toString(),
                              style: const TextStyle(
                                color: ktertiaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                CartIconButton(
                                  cartIcon: const Icon(Icons.remove),
                                  ontap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                        DecreaseCartItemQuantityEvent(
                                            cartItem));
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  cartItem.quantity.toString(),
                                  style: const TextStyle(
                                    color: ktertiaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CartIconButton(
                                    cartIcon: const Icon(Icons.add),
                                    ontap: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                          IncreaseCartItemQuantityEvent(
                                              cartItem));
                                      // cartItem.quantity++;
                                      print('increased');
                                      print(cartItem.quantity);
                                    })
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                
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
