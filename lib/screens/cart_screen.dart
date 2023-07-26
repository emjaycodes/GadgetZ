import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/repositories/product_repository.dart';
import 'package:oga_bassey/size_cofig.dart';
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
  final ProductRepository _repository = ProductRepository();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartloadedState) {
                final cartItems = state.cartlist;
                if (cartItems.isEmpty) {
                  return const Center(
                      child: Text("YOU HAVEN'T ADDED ANY ITEM TO CART"));
                }
                return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: SizeConfig.screenHeight * 0.2,
                          width: 7,
                          decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: SizeConfig.screenHeight * 0.9,
                                  width: SizeConfig.screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: ktertiaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.network(cartItem.image),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      cartItem.name,
                                      style: const TextStyle(
                                          color: ktertiaryColor,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis),
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
                                            BlocProvider.of<CartBloc>(context)
                                                .add(
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
                                              BlocProvider.of<CartBloc>(context)
                                                  .add(
                                                      IncreaseCartItemQuantityEvent(
                                                          cartItem));
                                              // cartItem.quantity++;
                                              print('increased');
                                              print(cartItem.quantity);
                                            })
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text("YOU HAVEN'T ADDED ANY ITEM TO CART"),
                );
              }
            },
          ),
        ), 
        if (cartList.isEmpty) const SizedBox() else Column(
          children: [
            Text(
              'Total: ${_repository.calculateTotalPrice().toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kprimaryColor
              ),
              ),
            InkWell(
              onTap: () {},
              child: Container(
                height: SizeConfig.screenHeight / 16,
                width: SizeConfig.screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: ktertiaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
