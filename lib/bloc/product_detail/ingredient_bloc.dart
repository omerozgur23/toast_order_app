import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_event.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  IngredientBloc() : super(IngredientState(isMarked: false)) {
    on<ToggleIngredientEvent>((event, emit) {
      emit(state.copyWith(isMarked: !state.isMarked));
    });
  }
}
