import 'package:equatable/equatable.dart';
import 'package:toast_order_app/models/product.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;

  final int quantity;

  final List<String> selectedIngredients;

  final String? note;

  AddToCartEvent(
      {required this.product,
      required this.quantity,
      required this.selectedIngredients,
      this.note});

  @override
  List<Object?> get props => [product, quantity, selectedIngredients, note];
}

class RemoveFromCartEvent extends CartEvent {
  final int index;

  RemoveFromCartEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateQuantityEvent extends CartEvent {
  final int index;
  final int quantity;

  UpdateQuantityEvent(this.index, this.quantity);

  @override
  List<Object?> get props => [index, quantity];
}
