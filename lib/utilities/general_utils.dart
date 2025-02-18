import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:injectable/injectable.dart';
import 'package:toast_order_app/constants/color.dart';

abstract class IGeneralUtils {
  String capitalizeWords(String text);
  Widget showCircularProgressIndicator();
}

@Injectable(as: IGeneralUtils)
class GeneralUtils implements IGeneralUtils {
  @override
  String capitalizeWords(String text) {
    return text
        .split(' ')
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '')
        .join(' ');
  }

  @override
  Widget showCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(HexColor(yellow)),
      ),
    );
  }
}
