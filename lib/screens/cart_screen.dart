import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/constants.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../components/cart_icon_button.dart';

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
                                Text(cartItem.quantity.toString()),
                                const SizedBox(
                                  width: 10,
                                ),
                                CartIconButton(
                                    cartIcon: const Icon(Icons.add),
                                    ontap: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                        IncreaseCartItemQuantityEvent(cartItem));
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
