import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class CustomerNoteInput extends StatelessWidget {
  final TextEditingController controller;
  const CustomerNoteInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.dynamicHeight(0.02)),
      child: TextField(
        controller: controller,
        maxLength: 500,
        maxLines: null,
        decoration: InputDecoration(
          labelText: "Notlar",
          labelStyle: TextStyle(color: HexColor(black)),
          hintText:
              "Alerjiniz ya da ürünle ilgili bize aktarmak istediğiniz bir şey varsa bize bildirin",
          hintStyle: TextStyle(fontSize: context.dynamicHeight(0.012)),
          // border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor(grey)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor(black)),
              borderRadius: BorderRadius.circular(10)),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(500),
        ],
      ),
    );
  }
}
