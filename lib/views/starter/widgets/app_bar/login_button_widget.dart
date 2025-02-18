import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_event.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<BottomNavigationBloc>().add(LoginEvent());
      },
      icon: const Icon(Icons.person_2_outlined),
      color: HexColor(black),
    );
  }
}
