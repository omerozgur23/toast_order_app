import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_event.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_state.dart';

class OrderTypeBloc extends Bloc<OrderTypeEvent, OrderTypeState> {
  String? selectedOrderType;

  OrderTypeBloc() : super(OrderTypeInitial()) {
    on<ShowBottomSheetEvent>((event, emit) {
      emit(OrderTypeSelectedState(selectedOrderType ?? "Sipariş Türü Seç"));
    });

    on<SelectedOrderTypeEvent>(
      (event, emit) {
        selectedOrderType = event.orderType;
        emit(OrderTypeSelectedState(selectedOrderType!));
      },
    );
  }
}
