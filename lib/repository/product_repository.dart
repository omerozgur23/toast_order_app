import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:toast_order_app/utilities/exception/error_handler.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchAll() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection("products").get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Product(
            id: doc.id,
            name: data["name"],
            description: (data["description"] is List)
                ? List<String>.from(data["description"])
                : [],
            price: (data["price"] is int)
                ? (data["price"] as int).toDouble()
                : data["price"] as double,
            imagePath: data["img_path"]);
      }).toList();
    } catch (e) {
      throw ErrorHandler.handleException(e);
    }
  }

  // Future<List<Product>> fetchAll() async {
  //   try {
  //     final snapshot = await _firestore.collection('products').get();
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   } catch (e) {
  //     throw ErrorHandler.handleException(e);
  //   }
  // }

  Future<List<Product>> fetchByCategory(String categoryId) async {
    try {
      DocumentReference categoryRef =
          _firestore.collection("categories").doc(categoryId);

      final QuerySnapshot snapshot = await _firestore
          .collection("products")
          .where("category_id", isEqualTo: categoryRef)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Product(
            id: doc.id,
            name: data["name"],
            description: (data["description"] is List)
                ? List<String>.from(data["description"])
                : [],
            price: (data["price"] is int)
                ? (data["price"] as int).toDouble()
                : data["price"] as double,
            imagePath: data["img_path"] ?? '');
      }).toList();
    } catch (e) {
      throw ErrorHandler.handleException(e);
    }
  }
}
