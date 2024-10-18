import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_event.dart';
// import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTypeButtonWidget extends StatelessWidget {
  const OrderTypeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<OrderTypeBloc>().add(ShowBottomSheetEvent());
      },
      style: ElevatedButton.styleFrom(
          minimumSize:
              Size(context.dynamicWidth(0.01), context.dynamicHeight(0.035)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)))),
      child: Row(children: [
        Text(
          "Adrese Teslim",
          style: TextStyle(color: HexColor(black)),
        ),
        Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: HexColor(black),
          size: context.dynamicHeight(0.025),
        )
      ]),
    );
  }
}
