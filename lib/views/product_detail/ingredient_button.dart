import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_bloc.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_event.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_state.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class IngredientButton extends StatelessWidget {
  final String ingredientName;
  final String ingredientId; // Eğer benzersiz tanımlanacaksa

  const IngredientButton({
    Key? key,
    required this.ingredientName,
    required this.ingredientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientBloc, IngredientState>(
      builder: (context, state) {
        return OutlinedButton(
          onPressed: () {
            context.read<IngredientBloc>().add(
                  ToggleIngredientEvent(ingredientId: ingredientId),
                );
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: HexColor("#dcdcdc"), width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicWidth(0.025),
              // vertical: context.dynamicHeight(0.005),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Malzeme metni: eğer işaretli ise metne kırmızı çizgi çek
              Text(
                ingredientName,
                style: TextStyle(
                  color: HexColor(black),
                  // fontSize: context.dynamicHeight(0.015),
                  decoration: state.isMarked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor:
                      state.isMarked ? HexColor(red) : Colors.transparent,
                  decorationThickness: 2,
                ),
              ),
              SizedBox(width: context.dynamicWidth(0.01)),
              // İkon: durumuna göre x veya refresh ikonu
              Icon(
                state.isMarked ? Icons.refresh : Icons.close,
                size: context.dynamicHeight(0.02),
                color: HexColor(black),
              ),
            ],
          ),
        );
      },
    );
  }
}
