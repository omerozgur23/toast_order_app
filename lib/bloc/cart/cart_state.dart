import 'package:equatable/equatable.dart';
import 'package:toast_order_app/models/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  final int itemCount;

  const CartState({this.items = const [], required this.itemCount});

  double get totalAmount => items.fold(0, (sum, item) => sum + item.totalPrice);

  @override
  List<Object?> get props => [items];
}

class CartInitial extends CartState {
  CartInitial() : super(items: [], itemCount: 0);
}

class CartLoaded extends CartState {
  const CartLoaded({required List<CartItem> items})
      : super(items: items, itemCount: items.length);
}
