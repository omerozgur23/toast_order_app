import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class AddressButtonWidget extends StatelessWidget {
  const AddressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: HexColor(yellow),
          side: BorderSide(color: HexColor(grey)),
          minimumSize:
              Size(context.dynamicWidth(0.01), context.dynamicHeight(0.035)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)))),
      child: Row(children: [
        Text(
          "Buton 2",
          style: TextStyle(color: HexColor(black)),
        ),
        Icon(
          Icons.edit,
          color: HexColor(black),
          size: context.dynamicHeight(0.02),
        )
      ]),
    );
  }
}
