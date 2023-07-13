import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  static String id = 'cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc _cartBloc;

  @override
  void initState() {
    _cartBloc = BlocProvider.of<CartBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('FAVOURITE'),
        // ),
        body: BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartloadedState) {
          final cartItems = state.cartlist;
          if (cartItems.isEmpty) {
            return Text("YOU HAVE'NT ADDED ANY ITEM TO CART");
          }
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            
            return ListTile(
                title: Text(cartItem.name),
                subtitle: Text('Price: ${cartItem.price}'));
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
