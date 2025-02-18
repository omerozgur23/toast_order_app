import 'package:equatable/equatable.dart';

abstract class OrderTypeState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderTypeInitial extends OrderTypeState {}

class ShowBottomSheetState extends OrderTypeState {}

class BottomSheetClosedState extends OrderTypeState {}

class BottomSheetOpenState extends OrderTypeState {
  final String? selectedOrderType;
  BottomSheetOpenState(this.selectedOrderType);
}

class OrderTypeSelectedState extends OrderTypeState {
  final String selectedOrderType;
  OrderTypeSelectedState(this.selectedOrderType);

  @override
  List<Object> get props => [selectedOrderType];
}
