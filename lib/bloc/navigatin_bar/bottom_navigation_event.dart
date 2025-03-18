import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TabChangedEvent extends BottomNavigationEvent {
  final int newIndex;
  TabChangedEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class LoginEvent extends BottomNavigationEvent {}

class UpdateCartCountEvent extends BottomNavigationEvent {
  final int count;
  UpdateCartCountEvent(this.count);

  @override
  List<Object> get props => [count];
}

class ChangeToOrderConfirmationScreen extends BottomNavigationEvent {}
