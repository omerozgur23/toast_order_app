import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_event.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetWidget {
  static void showOrderTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: context.dynamicHeight(0.38),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  indent: context.dynamicHeight(0.175),
                  endIndent: context.dynamicHeight(0.175),
                  thickness: 2.5,
                  color: HexColor(grey),
                ),
                Text(
                  "Merhaba Ömer!",
                  style: TextStyle(
                      fontSize: context.dynamicHeight(0.025),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Siparişini nasıl almak istersin ?",
                  style: TextStyle(
                    color: HexColor(grey),
                    fontSize: context.dynamicHeight(0.015),
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _buildCustomButton(
                  context: context,
                  text: "Adrese Teslim",
                  description: "Siparişini adresine getirelim.",
                  color: HexColor(yellow),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                _buildCustomButton(
                  context: context,
                  text: "Beklemeden Gel Al",
                  description: "Sıra beklemeden şubeden teslim al.",
                  color: HexColor(yellow),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      context.read<OrderTypeBloc>().add(ShowBottomSheetEvent());
    });
  }

  static Widget _buildCustomButton(
      {required BuildContext context,
      required String text,
      required String description,
      required Color color}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, context.dynamicHeight(0.11)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.delivery_dining,
          size: context.dynamicHeight(0.05),
          color: HexColor(white),
        ),
        Column(children: [
          Text(
            text,
            style: TextStyle(
                color: HexColor(black),
                fontSize: context.dynamicHeight(0.02),
                fontWeight: FontWeight.w600),
          ),
          Text(
            description,
            style: TextStyle(
              color: HexColor(grey),
              fontSize: context.dynamicHeight(0.013),
            ),
          )
        ]),
        Icon(
          Icons.arrow_forward_ios,
          size: context.dynamicHeight(0.03),
          color: HexColor(white),
        )
      ]),
    );
  }
}
