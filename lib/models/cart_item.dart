import 'package:toast_order_app/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final List<String> allIngredients;
  final List<String> markedIngredients;
  final String? note;

  CartItem(
      {required this.product,
      required this.quantity,
      required this.allIngredients,
      required this.markedIngredients,
      this.note});

  List<String> get remainingIngredients {
    return allIngredients
        .where((ingredient) => !markedIngredients.contains(ingredient))
        .toList();
  }

  double get totalPrice => product.price * quantity;
}
