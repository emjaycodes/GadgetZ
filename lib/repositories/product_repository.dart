import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oga_bassey/models/product.dart';

class ProductRepository {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');


  Stream<List<Product>> getProducts() {
    return productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // cart list
  final List<Product> _cartList = [];

  get cartList => _cartList;

  void addToCart(Product product) {
    _cartList.add(product);
  }

  void removeFromCart(Product product) {
    _cartList.remove(product);
  }

  // calculate Total Price of the cart

  int calculateTotalPrice(List<Product> cartProducts) {
    double totalPrice = 0.0;
    print(cartList);
    for (Product product in cartProducts) {
      totalPrice += product.price * product.quantity;
      print( product.price);
      print(product);
    }
    return totalPrice.round();
  }

  // liked product list

  final List<Product> _likedProduct = [];

  get likedProduct => _likedProduct;

  void addLikedProduct(Product product) {
    _likedProduct.add(product);
  }

  void deleteLikedProduct(Product product) {
    _likedProduct.remove(product);
  }
  
   // Update the cart item in the repository
  void updateCartItem(int index, Product updatedProduct) {
    if (index >= 0 && index < cartList.length) {
      cartList[index] = updatedProduct;
    }
  }


}
