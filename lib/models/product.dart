class Product {
   int id;
  final String name;
  final double price;
  final String brand;
  final String image;
  final String description;
  int quantity;
  bool liked = false; 

  Product(this.id, this.name, this.price, this.brand, this.description, this.image,
      this.quantity, this.liked);

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'price': price,
  //     'brand': brand,
  //     'image': image,
  //     'quantity': quantity,
  //   };
  // }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(map['id'], map['name'], map['price'], map['brand'], map['description'],
        map['image'], map['quantity'], map['liked']);
  }

  @override
  String toString() {
    return '{id: $id, name: $name, price: $price, brand: $brand, description: $description, quantity: $quantity, image: $image}';
  }
}
