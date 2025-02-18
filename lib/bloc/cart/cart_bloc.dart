import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/cart/cart_event.dart';
import 'package:toast_order_app/bloc/cart/cart_state.dart';
import 'package:toast_order_app/models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<UpdateQuantityEvent>(_onUpdateQuantity);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final updatedItems = [...state.items];
    final cartItem = CartItem(
        product: event.product,
        quantity: event.quantity,
        selectedIngredients: event.selectedIngredients,
        note: event.note);

    updatedItems.add(cartItem);
    emit(CartState(items: updatedItems));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedItems = [...state.items];
    updatedItems.removeAt(event.index);
    emit(CartState(items: updatedItems));
  }

  void _onUpdateQuantity(UpdateQuantityEvent event, Emitter<CartState> emit) {
    final updatedItems = [...state.items];
    if (event.quantity > 0) {
      final updatedItem = CartItem(
          product: updatedItems[event.index].product,
          quantity: event.quantity,
          selectedIngredients: updatedItems[event.index].selectedIngredients,
          note: updatedItems[event.index].note);
      updatedItems[event.index] = updatedItem;
      emit(CartState(items: updatedItems));
    }
  }
}
