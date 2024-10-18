import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast_order_app/models/category.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Category>> fetchAll() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection("categories").get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        String name = data["category_name"] ?? "Kategori Yok";
        return Category(id: doc.id, name: name);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }
}
