import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/cart_bloc/cart_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';
import 'package:oga_bassey/components/snack_bar.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/size_cofig.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
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
                  widget.product.image,
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
                    widget.product.name,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        color: kprimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$ ${widget.product.price}',
                    style: const TextStyle(color: kprimaryColor, fontSize: 25),
                  ),
                ],
              ),
            ),
            kbigSizedbox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
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
                  widget.product.description,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<LikedProductBloc, LikedProductState>(
                    listener: (context, state) {
                      if (state is LikeProductLoadedState) {
                        // Show a snackbar when the product is liked
                        showSnackbarMessage("Product has been liked!",  Icons.favorite, context,);
                      } else if(state is DislikedProductState){
                        // Show a snackbar when the product is liked
                        showSnackbarMessage("Product has been disliked!",  Icons.favorite, context,);
                        widget.product.liked = false;
                      }
                    },
                    builder: (BuildContext context, state) {
                      return InkWell(
                        onTap: () {
                          if (widget.product.liked == false) {
                            BlocProvider.of<LikedProductBloc>(context).add(
                            LikeProductEvent(widget.product),
                          );
                           widget.product.liked = !widget.product.liked;
                          print(widget.product.liked);
                          } else if (widget.product.liked == true){
                              BlocProvider.of<LikedProductBloc>(context).add(UnlikeProduct(widget.product));
                          }
                          
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
                          child: widget.product.liked == true
                              ? const Icon(Icons
                                  .favorite) // Icon to show when product.liked is true
                              : const Icon(Icons.favorite_border),
                        ),
                      );
                    },
                  ),
                  AddToCartButton(product: widget.product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartloadedState) {
          // Show a snackbar when the product is added to the cart
          showSnackbarMessage("Product added to cart!", Icons.check_circle, context);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<CartBloc>(context).add(AddToCartEvent(product));
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
        );
      },
    );
  }
}

