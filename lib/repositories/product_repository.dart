import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oga_bassey/models/product.dart';

class ProductRepository {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> saveProduct(Product product) {
    return productsCollection.doc().set(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
