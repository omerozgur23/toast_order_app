import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/cart/cart_bloc.dart';
import 'package:toast_order_app/bloc/cart/cart_event.dart';
import 'package:toast_order_app/bloc/cart/cart_state.dart';
import 'package:toast_order_app/config/injection.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/cart_item.dart';
import 'package:toast_order_app/utilities/general_utils.dart';

class CartScreen extends StatelessWidget {
  final generalUtils = getIt<IGeneralUtils>();
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const Center(
            child: Text(
              "Sepetinizde ürün bulunmuyor",
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return Scaffold(
            backgroundColor: HexColor("#f6f6f6"),
            body: Column(
              children: [
                _buildOrderSteps(context),
                SizedBox(height: context.dynamicHeight(0.02)),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return _buildCartItem(context, item, index);
                  },
                )),
              ],
            ),
            bottomNavigationBar: _buildBottomBar(context, state.totalAmount));
      },
    );
  }

  Widget _buildOrderSteps(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor(yellow),
          border: Border.all(color: HexColor(grey)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(context.dynamicHeight(0.02)),
              bottomRight: Radius.circular(context.dynamicHeight(0.02)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.1),
            vertical: context.dynamicHeight(0.01)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOrderStepText("Sepetim", HexColor(black)),
            const Icon(Icons.arrow_circle_right_outlined),
            _buildOrderStepText("Sipariş Onayı", HexColor(white)),
            const Icon(Icons.arrow_circle_right_outlined),
            _buildOrderStepText("Sipariş Sonuç", HexColor(white))
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStepText(String text, HexColor textColor) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item, int index) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.05),
          vertical: context.dynamicHeight(0.015)),
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      decoration: BoxDecoration(
          color: HexColor(white),
          border: Border.all(color: HexColor("f6f6f6"), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                generalUtils.capitalizeWords(item.product.name),
                style: TextStyle(fontSize: context.dynamicHeight(0.018)),
              ),
              Text(
                "${item.totalPrice.toStringAsFixed(2)} TL",
                style: TextStyle(
                    color: HexColor(olive), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(item.remainingIngredients.join(", ")),
          SizedBox(height: context.dynamicHeight(0.02)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.dynamicHeight(0.044),
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#dcdcdc"), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  IconButton(
                      onPressed: () => _decreaseQuantity(context, index, item),
                      icon: const Icon(Icons.remove)),
                  Text(item.quantity.toString()),
                  IconButton(
                      onPressed: () =>
                          _increasingQuantity(context, index, item),
                      icon: const Icon(Icons.add)),
                ]),
              ),
              IconButton(
                onPressed: () => _removeProductFromCartItems(context, index),
                icon: const Icon(Icons.delete_forever_rounded),
                color: HexColor(red),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, double totalAmount) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.04),
          vertical: context.dynamicHeight(0.01)),
      decoration: BoxDecoration(
          color: HexColor(yellow),
          border: Border.all(color: HexColor(grey)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.dynamicHeight(0.02)),
              topRight: Radius.circular(context.dynamicHeight(0.02)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${totalAmount.toStringAsFixed(2)} TL"),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Ödeme Yap",
                style: TextStyle(color: HexColor(black)),
              ))
        ],
      ),
    );
  }

  void _increasingQuantity(BuildContext context, int index, CartItem item) {
    if (item.quantity < 10) {
      context
          .read<CartBloc>()
          .add(UpdateQuantityEvent(index, item.quantity + 1));
    }
  }

  void _decreaseQuantity(BuildContext context, int index, CartItem item) {
    final cartBloc = context.read<CartBloc>();

    if (item.quantity > 1) {
      cartBloc.add(UpdateQuantityEvent(index, item.quantity - 1));
    } else {
      cartBloc.add(RemoveFromCartEvent(index));
    }
  }

  void _removeProductFromCartItems(BuildContext context, int index) {
    context.read<CartBloc>().add(RemoveFromCartEvent(index));
  }
}
