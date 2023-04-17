// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/components/product_container.dart';
import 'package:oga_bassey/constants.dart';


class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  static String id = 'product_screen';

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductContainer(
                 productImage: 'images/Asus.png', 
              productName: 'proArt StudioBook', productPrice: 'Azus', productbrand: '\$2338,1',),
              ProductContainer(
                 productImage: 'images/zen2.png', 
              productName: 'Zenbook Duo', productPrice: 'Azus', productbrand: '\$1272,2',)
              ],
            ),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductContainer(
                 productImage: 'images/zen_pro.png', 
              productName: 'Zenbook pro Duo', productPrice: 'Azus', productbrand: '\$3096,97',),
              ProductContainer(
                 productImage: 'images/macbook.png', 
              productName: 'Macbook Pro', productPrice: 'Apple', productbrand: '\$1238,75',)
              ],
            ),
          ),
          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductContainer(
                 productImage: 'images/Asus.png', 
              productName: 'proArt StudioBook', productPrice: 'Azus', productbrand: '\$2338,1',),
              ProductContainer(
                 productImage: 'images/macbook.png', 
              productName: 'Macbook pro 2', productPrice: 'Apple', productbrand: '\$1354,11',)
              ],
            ),
          )
          // ProductRows( 
          //   productImage1: 'images/Asus.png', 
          //   productName1: 'proArt StudioBook', productPrice1: 'Azus', productbrand1: '\$2338,1', ),
          // kbigSizedbox,
          
        ],
      ),
    );
  }
}

class ProductRows extends StatelessWidget {
  final String productName1;
  final String productbrand1;
  final String productPrice1;
  final String productImage1;



  const ProductRows({
    super.key, required this.productName1, required this.productbrand1, required this.productPrice1, required this.productImage1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProductContainer(productImage: productImage1, productName: productName1, productbrand: productbrand1, productPrice: productPrice1,),
        ProductContainer(productImage: productImage1, productName: productName1, productbrand: productbrand1, productPrice: productPrice1,),
      ],
    );
  }
  
}
// 