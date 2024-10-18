import 'package:flutter/material.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/views/account/account_screen.dart';
import 'package:toast_order_app/views/cart/cart_screen.dart';
import 'package:toast_order_app/views/home/home_screen.dart';
import 'package:toast_order_app/views/login/login_screen.dart';
import 'package:toast_order_app/views/offer/offer_screen.dart';

class BodyContentWidget extends StatelessWidget {
  final BottomNavigationState state;
  const BodyContentWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is HomeScreenState) {
      return const HomeScreen();
    } else if (state is CartScreenState) {
      return const CartScreen();
    } else if (state is OfferScreenState) {
      return const OfferScreen();
    } else if (state is AccountScreenState) {
      return const AccountScreen();
    } else if (state is LoginScreenState) {
      return const LoginScreen();
    } else {
      return const Center(child: Text("Beklenmeyen bir hata oluştu!"));
    }
  }
}
