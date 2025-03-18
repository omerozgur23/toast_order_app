import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int _cartItemCount = 0;

  BottomNavigationBloc() : super(HomeScreenState()) {
    on<TabChangedEvent>((event, emit) {
      switch (event.newIndex) {
        case 0:
          emit(HomeScreenState(cartItemCount: _cartItemCount));
          break;
        case 1:
          emit(CartScreenState(cartItemCount: _cartItemCount));
          break;
        case 2:
          emit(OfferScreenState(cartItemCount: _cartItemCount));
          break;
        case 3:
          emit(AccountScreenState(cartItemCount: _cartItemCount));
          break;
      }
    });

    on<LoginEvent>((event, emit) {
      emit(LoginScreenState(cartItemCount: _cartItemCount));
    });

    on<UpdateCartCountEvent>((event, emit) {
      _cartItemCount = event.count;

      emit(state.runtimeType.toString() == 'HomeScreenState'
          ? HomeScreenState(cartItemCount: _cartItemCount)
          : state.runtimeType.toString() == "CartScreenState"
              ? CartScreenState(cartItemCount: _cartItemCount)
              : state.runtimeType.toString() == "OfferScreenState"
                  ? OfferScreenState(cartItemCount: _cartItemCount)
                  : state.runtimeType.toString() == "AccountScreen"
                      ? AccountScreenState(cartItemCount: _cartItemCount)
                      : LoginScreenState(cartItemCount: _cartItemCount));
    });

    on<ChangeToOrderConfirmationScreen>((event, emit) {
      emit(OrderConfirmationScreenState());
    });
  }
}
