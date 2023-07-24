import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oga_bassey/models/product.dart';

class ProductRepository {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  // Future<void> saveProduct(Product product) {
  //   return productsCollection.doc().set(product.toMap());
  // }

  Stream<List<Product>> getProducts() {
    return productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

    Future<void> updateProductLikedStatus(Product product) {
    return productsCollection
        .doc(product.id.toString()) // Assuming each product has a unique 'id' in Firebase
        .update({'liked': product.liked});
  }

  final List<Product> _cartList = [];

  get cartList => _cartList;

  void addToCart(Product product) {
    _cartList.add(product);
  }

  void removeFromCart(Product product) {
    _cartList.remove(product);
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (Product product in _cartList) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

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
