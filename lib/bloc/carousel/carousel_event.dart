abstract class CarouselEvent {}

class CarouselChangeEvent extends CarouselEvent {
  final int index;
  CarouselChangeEvent(this.index);
}
