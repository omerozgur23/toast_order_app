import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_event.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_state.dart';

class OrderTypeBloc extends Bloc<OrderTypeEvent, OrderTypeState> {
  OrderTypeBloc() : super(OrderTypeInitial()) {
    on<ShowBottomSheetEvent>((eent, emit) {
      if (state is BottomSheetClosedState) {
        emit(BottomSheetOpenState());
      } else {
        emit(BottomSheetClosedState());
      }
    });
  }
}
