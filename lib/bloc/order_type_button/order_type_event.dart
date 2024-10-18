import 'package:equatable/equatable.dart';

abstract class OrderTypeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowBottomSheetEvent extends OrderTypeEvent {}
