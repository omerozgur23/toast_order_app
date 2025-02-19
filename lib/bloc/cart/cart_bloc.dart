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
    final markedIngredients = event.markedIngredients ?? [];
    final allIngredients = event.allIngredients ?? [];

    final remainingIngredients = allIngredients
        .where((ingredient) => !markedIngredients.contains(ingredient))
        .toList();

    final existingIndex = updatedItems.indexWhere((item) =>
        item.product.id == event.product.id &&
        item.remainingIngredients.length == remainingIngredients.length &&
        item.remainingIngredients
            .every((ing) => remainingIngredients.contains(ing)));

    if (existingIndex != -1) {
      final existingItem = updatedItems[existingIndex];
      final updatedItem = CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + event.quantity,
          allIngredients: existingItem.allIngredients,
          markedIngredients: existingItem.markedIngredients,
          note: existingItem.note);

      updatedItems[existingIndex] = updatedItem;
    } else {
      final cartItem = CartItem(
          product: event.product,
          quantity: event.quantity,
          allIngredients: allIngredients,
          markedIngredients: markedIngredients,
          note: event.note);
      updatedItems.add(cartItem);
    }

    // Güncellenmiş sepet durumunu yayınla
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
      final currentItem = updatedItems[event.index];
      final updatedItem = CartItem(
          product: updatedItems[event.index].product,
          quantity: event.quantity,
          allIngredients: currentItem.allIngredients,
          markedIngredients: currentItem.markedIngredients,
          note: updatedItems[event.index].note);
      updatedItems[event.index] = updatedItem;
      emit(CartState(items: updatedItems));
    }
  }
}
