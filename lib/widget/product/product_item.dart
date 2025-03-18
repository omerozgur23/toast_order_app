import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/config/injection.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:toast_order_app/services/direct_cart_service.dart';
import 'package:toast_order_app/utilities/general_utils.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final cartService = getIt<IDirectCartService>();
  final generalUtils = getIt<IGeneralUtils>();

  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => cartService.handleProductAction(context, product),
      child: Container(
        padding: EdgeInsets.all(context.dynamicHeight(0.01)),
        decoration: BoxDecoration(
            color: HexColor(white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(context, product),
              SizedBox(width: context.dynamicWidth(0.03)),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductName(context, product),
                      _buildProductDescription(context, product),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProductPrice(context, product),
                      _buildOrderButton(context, product)
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, Product product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        product.imagePath,
        width: context.dynamicWidth(0.29),
        height: context.dynamicHeight(0.135),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductName(BuildContext context, Product product) {
    return Text(
      generalUtils.capitalizeWords(product.name),
      style: TextStyle(
          fontSize: context.dynamicHeight(0.017),
          fontWeight: FontWeight.bold,
          color: HexColor(black)),
    );
  }

  Widget _buildProductDescription(BuildContext context, Product product) {
    return Text(
      product.description.join(', '),
      style: TextStyle(
        fontSize: context.dynamicHeight(0.012),
        color: HexColor(grey),
      ),
    );
  }

  Widget _buildProductPrice(BuildContext context, Product product) {
    return Text(
      '${product.price.toStringAsFixed(2)} TL',
      style: TextStyle(
          fontSize: context.dynamicHeight(0.018),
          fontWeight: FontWeight.bold,
          color: HexColor(black)),
    );
  }

  Widget _buildOrderButton(BuildContext context, Product product) {
    return ElevatedButton(
        onPressed: () => cartService.handleProductAction(context, product),
        style: ElevatedButton.styleFrom(
            backgroundColor: HexColor(white),
            padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.04),
                vertical: context.dynamicHeight(0.01)),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: HexColor(yellow), width: 1.0),
                borderRadius: BorderRadius.circular(10.0))),
        child: Text(
          _getButtonText(product.directCartBtn),
          style: TextStyle(
              fontSize: context.dynamicHeight(0.014), color: HexColor(black)),
        ));
  }

  String _getButtonText(bool directCartBtn) {
    return directCartBtn ? "Sepete Ekle" : "Sipariş Ver";
  }
}
