import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/category.dart';
import 'package:toast_order_app/utilities/general_utils.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
        padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.05),
            vertical: context.dynamicHeight(0.01)),
        decoration: BoxDecoration(
          border: Border.all(color: HexColor(yellow), width: 2),
          color: isSelected ? HexColor(yellow) : HexColor(white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            GeneralUtils.capitalizeWords(category.name),
            style: TextStyle(
              color: isSelected ? HexColor(white) : HexColor(black),
              fontSize: context.dynamicHeight(0.015),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
