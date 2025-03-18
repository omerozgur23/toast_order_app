import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_state.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class AddressButtonWidget extends StatelessWidget {
  const AddressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTypeBloc, OrderTypeState>(
      builder: (context, state) {
        String buttonText = "Adres Seç";

        if (state is OrderTypeSelectedState) {
          if (state.selectedOrderType == "Beklemeden Gel Al") {
            buttonText = "Semerkand Şubesi";
          } else if (state.selectedOrderType == "Adrese Teslim") {
            buttonText = "Adres Seç";
          }
        }

        return ElevatedButton(
          onPressed: () {
            if (buttonText == "Adres Seç") {
              _showAddressSelectionBottomSheet(context);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: HexColor(black),
              side: BorderSide(color: HexColor(white)),
              minimumSize: Size(
                  context.dynamicWidth(0.01), context.dynamicHeight(0.035)),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)))),
          child: Row(children: [
            Text(
              buttonText,
              style: TextStyle(
                  fontSize: context.dynamicHeight(0.013),
                  color: HexColor(white)),
            ),
            Icon(
              Icons.edit,
              color: HexColor(white),
              size: context.dynamicHeight(0.02),
            )
          ]),
        );
      },
    );
  }

  void _showAddressSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Adreslerim",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              title: Text("Ev - İstanbul"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
