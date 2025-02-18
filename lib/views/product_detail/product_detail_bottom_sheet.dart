import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/cart/cart_bloc.dart';
import 'package:toast_order_app/bloc/cart/cart_event.dart';
import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/bloc/product/product_event.dart';
import 'package:toast_order_app/bloc/product_detail/ingredient_bloc.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:toast_order_app/utilities/general_utils.dart';
import 'package:toast_order_app/views/product_detail/customer_note_input.dart';
import 'package:toast_order_app/views/product_detail/ingredient_button.dart';

class ProductDetailBottomSheet extends StatefulWidget {
  final Product product;

  const ProductDetailBottomSheet({super.key, required this.product});

  @override
  State<ProductDetailBottomSheet> createState() =>
      _ProductDetailBottomSheetState();
}

class _ProductDetailBottomSheetState extends State<ProductDetailBottomSheet> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    final generalUtils = GeneralUtils();
    return DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        builder: (_, scrollController) {
          return Scaffold(
              // resizeToAvoidBottomInset: true,
              backgroundColor: HexColor(white),
              appBar: _buildProductDetailAppBar(context, generalUtils),
              body: Column(children: [
                Expanded(
                    child:
                        _buildProductDetailContent(context, scrollController)),
                _buildBottomBar(context)
              ]));
        });
  }

  AppBar _buildProductDetailAppBar(
      BuildContext context, GeneralUtils generalUtils) {
    return AppBar(
      centerTitle: true,
      title: Text(
        generalUtils.capitalizeWords(widget.product.name),
        style: TextStyle(
            fontSize: context.dynamicHeight(0.02), fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductDetailContent(
      BuildContext context, ScrollController scrollController) {
    final TextEditingController noteController = TextEditingController();

    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        decoration: BoxDecoration(
          color: HexColor(white),
        ),
        child: Column(
          children: [
            _buildProductImage(context),
            _buildProductDescription(context),
            Container(
              margin: EdgeInsets.only(
                  top: context.dynamicHeight(0.02),
                  left: context.dynamicWidth(0.03),
                  right: context.dynamicWidth(0.03)),
              child: Column(children: [
                _buildProductCountButton(context),
                _buildContentSubtitle(context, "Standart Malzemeler"),
                _buildIngredientButtons(context,
                    ["Sucuk", "Kaşar", "Domates", "Jalepeno", "Tereyağı"]),
                _buildContentSubtitle(context, "Ürün Notu"),
                CustomerNoteInput(controller: noteController)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Center(
      child: ClipRRect(
        child: Image.asset(
          widget.product.imagePath,
          width: double.infinity,
          height: context.dynamicHeight(0.3),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.dynamicHeight(0.01),
          left: context.dynamicWidth(0.03),
          right: context.dynamicWidth(0.03)),
      child: Text(
        widget.product.description.join(", "),
        style: TextStyle(
            fontSize: context.dynamicHeight(0.015), color: HexColor(grey)),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.05),
          vertical: context.dynamicHeight(0.02)),
      decoration: BoxDecoration(
          color: HexColor(white),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildProductPrice(context), _buildAddToCartButton(context)],
      ),
    );
  }

  Widget _buildProductPrice(BuildContext context) {
    return Text(
      "${(widget.product.price * _quantity).toStringAsFixed(2)} TL",
      style: TextStyle(
          fontSize: context.dynamicHeight(0.022),
          fontWeight: FontWeight.bold,
          color: HexColor(olive)),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onAddToCartPressed(context),
      style: ElevatedButton.styleFrom(
          backgroundColor: HexColor(green),
          padding: EdgeInsets.symmetric(
              horizontal: context.dynamicWidth(0.1),
              vertical: context.dynamicHeight(0.015)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text("Sepete Ekle",
          style: TextStyle(
              fontSize: context.dynamicHeight(0.015), color: HexColor(white))),
    );
  }

  void _onAddToCartPressed(BuildContext context) {
    final selectedIngredients = ["malzemeler"];
    final note = "not";

    // final cartItems = context.read<CartBloc>().state.items;

    // final existingCartItem = cartItems.firstWhere(
    //   (item) => item.product.id == widget.product.id,
    //   // orElse: () => null,
    // );

    // if (existingCartItem != null) {
    //   context.read<CartBloc>().add(UpdateQuantityEvent(0, existingCartItem.quantity + 1));
    // } else {

    // }
    context.read<CartBloc>().add(AddToCartEvent(
        product: widget.product,
        quantity: _quantity,
        selectedIngredients: selectedIngredients,
        note: note));

    Navigator.pop(context);
  }

  Widget _buildProductCountButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
          decoration: BoxDecoration(
              border: Border.all(color: HexColor("#dcdcdc"), width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (_quantity > 1) {
                    setState(() {
                      _quantity--;
                    });
                    context
                        .read<ProductBloc>()
                        .add(UpdateProductQuantityEvent(_quantity));
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Text("$_quantity"),
              IconButton(
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                  context
                      .read<ProductBloc>()
                      .add(UpdateProductQuantityEvent(_quantity));
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentSubtitle(BuildContext context, String subtitle) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: context.dynamicHeight(0.02)),
        child: Text(
          subtitle,
          style: TextStyle(
              fontSize: context.dynamicHeight(0.015),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildIngredientButtons(
      BuildContext context, List<String> ingredients) {
    return Padding(
      padding: EdgeInsets.only(top: context.dynamicHeight(0.02)),
      child: Wrap(
          spacing:
              context.dynamicWidth(0.02), // Butonlar arasındaki yatay boşluk
          // runSpacing: context.dynamicHeight(0.001), // Satırlar arasındaki boşluk
          children: ingredients.map((ingredient) {
            return BlocProvider(
              create: (_) => IngredientBloc(),
              child: IngredientButton(
                  ingredientName: ingredient, ingredientId: ingredient),
            );
          }).toList()),
    );
  }
}
