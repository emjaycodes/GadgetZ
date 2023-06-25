import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String brand;
  // final String image;
  Product(
    this.name,
    this.price,
    this.brand,
    // this.image,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'brand': brand,
      // 'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
       map['price'],
       map['brand'],
      //  map['image'],
    );
  }
}


