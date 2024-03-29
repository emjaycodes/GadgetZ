import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/payment_bloc/payment_bloc.dart';
import 'package:oga_bassey/models/user_model.dart';
import 'package:oga_bassey/screens/checkout_screen.dart';
import 'package:oga_bassey/components/checkout_button.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/repositories/product_repository.dart';
import 'package:oga_bassey/size_cofig.dart';
import 'package:oga_bassey/theme/app_theme.dart';
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
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.getThemeData(context).colorScheme;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: themeData.background,
        body: Column(
      children: [
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(),
                );
              } 
              
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
                      return CartContainer(cartItem: cartItem);
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
              'Total: \$${ProductRepository().calculateTotalPrice(cartList)}',  
              style:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeData.tertiary
              ),
              ),
             CheckoutButton(
              buttonText: 'Checkout',
               ontap: (){
                final totalCartPrice = ProductRepository().calculateTotalPrice(cartList);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen(productList: cartList, totalCartPrice: totalCartPrice.toDouble())));},),
                 
          ],
        ),
      ],
    ));
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.cartItem,
  });

  final Product cartItem;

  @override
  Widget build(BuildContext context) {
  print('Rebuilding CartScreen with quantity: ${cartItem.quantity}');
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
                            print('decrease');
                            print(cartItem.quantity);
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
  }
}