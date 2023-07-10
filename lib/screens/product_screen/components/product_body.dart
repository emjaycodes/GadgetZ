// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/constants.dart';

import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../components/product_container.dart';
import '../../../models/product.dart';


class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  static String id = 'product_screen';

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
    late ProductBloc _productBloc;
  
  @override
  void initState() {
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(FetchProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: ktertiaryColor,
              labelText: 'Search in Laptops',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () {
                    setState(() {
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide(
                  //   width: 3, color: kprimaryColor,
                  // ),
                  borderRadius: BorderRadius.circular(10)
                )
                ),
          ),
        ),
        kbigSizedbox,
        Padding(
          padding: const EdgeInsets.only(left:10.0, right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('40 Laptop Products'),
              Container(
                height: 35,
                width: 90,
                decoration: BoxDecoration(
                  color: ktertiaryColor,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sort By'),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              )
            ],
          ),
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
                    productPrice: product.price,
                    productbrand: product.brand,
                    // productImage: product.image,
                  );
                },
              );
            } else if (state is ProductErrorState) {
              print(state.errorMessage.toString());
              return Text('Error: ${state.errorMessage.toString()}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
       
      ],
    );
  }
} 