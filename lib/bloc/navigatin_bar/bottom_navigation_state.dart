part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState {
  final int cartItemCount;
  BottomNavigationState({this.cartItemCount = 0});
}

// class BottomNavigationSelected extends BottomNavigationState {
//   final int selectedIndex;
//   BottomNavigationSelected(this.selectedIndex);
// }

class HomeScreenState extends BottomNavigationState {
  HomeScreenState({super.cartItemCount});
}

class CartScreenState extends BottomNavigationState {
  CartScreenState({super.cartItemCount});
}

class OfferScreenState extends BottomNavigationState {
  OfferScreenState({super.cartItemCount});
}

class AccountScreenState extends BottomNavigationState {
  AccountScreenState({super.cartItemCount});
}

class LoginScreenState extends BottomNavigationState {
  LoginScreenState({super.cartItemCount});
}

class OrderConfirmationScreenState extends BottomNavigationState {}
