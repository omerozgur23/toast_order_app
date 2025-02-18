import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/carousel/carousel_event.dart';
import 'package:toast_order_app/bloc/carousel/carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState(0)) {
    on<CarouselChangeEvent>((event, emit) {
      emit(CarouselState(event.index));
    });
  }
}
