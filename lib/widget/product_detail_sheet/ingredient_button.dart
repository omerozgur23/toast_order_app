import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_bloc.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_event.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class IngredientButton extends StatelessWidget {
  final String ingredient;
  final bool isMarked;

  const IngredientButton(
      {super.key, required this.ingredient, required this.isMarked});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print(ingredient);
        context
            .read<IngredientBloc>()
            .add(ToggleIngredientEvent(ingredient: ingredient));
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: HexColor("#dcdcdc"), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.025),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ingredient,
            style: TextStyle(
              color: HexColor(black),
              decoration:
                  isMarked ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: isMarked ? HexColor(red) : Colors.transparent,
              decorationThickness: 2,
            ),
          ),
          SizedBox(width: context.dynamicWidth(0.01)),
          Icon(
            isMarked ? Icons.refresh : Icons.close,
            size: context.dynamicHeight(0.02),
            color: HexColor(black),
          ),
        ],
      ),
    );
  }
}
