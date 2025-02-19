import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_event.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  IngredientBloc() : super(const IngredientState(markedIngredients: [])) {
    on<ToggleIngredientEvent>((event, emit) {
      final currentIngredients = List<String>.from(state.markedIngredients);

      currentIngredients.contains(event.ingredient)
          ? currentIngredients.remove(event.ingredient)
          : currentIngredients.add(event.ingredient);

      emit(IngredientState(markedIngredients: currentIngredients));
    });
  }
}
