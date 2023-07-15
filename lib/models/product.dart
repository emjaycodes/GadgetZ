class Product {
  final String name;
  final double price;
  final String brand;
  // final String image;
  final String description;
  final int quantity;

  Product(
    this.name,
    this.price,
    this.brand, 
    this.description,
    // this.image,
    this.quantity
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'brand': brand,
      // 'image': image,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
      map['price'],
      map['brand'],
      map['description'],
      //  map['image'],
      map['quantity'] 
    );
  }

  @override
  String toString() {
    return '{name: $name, price: $price, brand: $brand, description: $description, quantity: $quantity}';
  }
}
