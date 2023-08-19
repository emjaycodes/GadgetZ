// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/components/horizontal_stack_scroll.dart';
import 'package:oga_bassey/components/product_container.dart';
import 'package:oga_bassey/components/shimmer_loading.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/screens/product_details_screen.dart';
import 'package:oga_bassey/screens/product_screen/components/product_body.dart';
import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../components/custom_stack.dart';
import '../../../size_cofig.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool istapped = true;

  void toggleColour() {
    if (istapped == true) {
      istapped == false;
    }
  }

  void toggleColourBack() {
    if (istapped == false) {
      istapped == true;
    }
  }

  // late ProductList productList = ProductList();
  late ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(FetchProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ksmallSizedbox,
        Center(
          child: CustomStackWidget(),
        ),
        kbigSizedbox,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 10,
                ),
                HorizontalStackScroll(
                  activeColor: kprimaryColor,
                  ontap: () {
                    setState(() {
                      toggleColour();
                    });
                  },
                  gadgetType: Text(
                    'Laptops',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ktertiaryColor,
                    ),
                  ),
                  productAmount: Text(
                    '40 products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ktertiaryColor,
                    ),
                  ),
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  ontap: () {
                    toggleColourBack();
                    print(istapped);
                  },
                  activeColor: ktertiaryColor,
                  gadgetType: Text(
                    'Smartphone',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                  ),
                  productAmount: Text(
                    '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                  ),
                  productImage: 'images/iphone.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  activeColor: ktertiaryColor,
                  gadgetType: Text(
                    'Smartphone',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                  ),
                  productAmount: Text(
                    '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                  ),
                  productImage: 'images/iphone.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  activeColor: ktertiaryColor,
                  gadgetType: Text(
                    'Laptops',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kprimaryColor,
                    ),
                  ),
                  productAmount: Text(
                    '24 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor,
                    ),
                  ),
                  productImage: 'images/zen.png',
                ),
                SizedBox(
                  width: 5,
                ),
                HorizontalStackScroll(
                  activeColor:
                      istapped == true ? kprimaryColor : ktertiaryColor,
                  gadgetType: Text(
                    'Laptop',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ktertiaryColor,
                    ),
                  ),
                  productAmount: Text(
                    '50 Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ktertiaryColor,
                    ),
                  ),
                  productImage: 'images/zen.png',
                ),
              ],
            ),
          ),
        ),
        kbigSizedbox,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                'Popular Product',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductBody.id);
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(),
                  )),
            ),
          ],
        ),
        kbigSizedbox,
        Expanded(
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: _productBloc,
            builder: (context, state) {
              if (state is ProductsUpdatedState) {
                final List<Product> products = state.products;

                return GridView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1 / 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final Product product = products[index];
                    return ProductContainer(
                      productName: product.name,
                      //you changed to int for experiment
                      productPrice: product.price,
                      productbrand: product.brand,
                      productImage: product.image,
                      ontap: () {
                        BlocProvider.of<ProductBloc>(context)
                            .add(NavigateToProductDetailsEvent(product));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)));
                      },
                    );
                  },
                );
              } else if (state is ProductErrorState) {
                print(state.errorMessage.toString());
                 Text('Error: ${state.errorMessage.toString()}');
                 return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: Unable to fetch products',
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _productBloc.add(FetchProductsEvent());
                      },
                      child: Text('Retry'),
                    ),
                  ],    
                ),
                 );

              } else {
                return Center(child: ShimmerList());
              }
            },
          ),
        ),
      ],
    );
  }
}
