import 'package:toast_order_app/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final List<String> selectedIngredients;
  final String? note;

  CartItem(
      {required this.product,
      required this.quantity,
      required this.selectedIngredients,
      this.note});

  double get totalPrice => product.price * quantity;
}
