import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(HomeScreenState()) {
    on<TabChangedEvent>((event, emit) {
      switch (event.newIndex) {
        case 0:
          emit(HomeScreenState());
          break;
        case 1:
          emit(CartScreenState());
          break;
        case 2:
          emit(OfferScreenState());
          break;
        case 3:
          emit(AccountScreenState());
          break;
      }
    });

    on<LoginEvent>((event, emit) {
      emit(LoginScreenState());
    });
  }
}
