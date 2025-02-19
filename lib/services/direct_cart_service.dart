import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:injectable/injectable.dart';
import 'package:toast_order_app/bloc/cart/cart_bloc.dart';
import 'package:toast_order_app/bloc/cart/cart_event.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/views/product_detail/product_detail_bottom_sheet.dart';

abstract class IDirectCartService {
  void handleProductAction(BuildContext context, Product product);
}

@Injectable(as: IDirectCartService)
class DirectCartService implements IDirectCartService {
  @override
  void handleProductAction(BuildContext context, Product product) {
    if (product.directCartBtn) {
      _addToCartDirectly(context, product);
    } else {
      _showProductDetail(context, product);
    }
  }

  void _addToCartDirectly(BuildContext context, Product product) {
    context.read<CartBloc>().add(
          AddToCartEvent(
            product: product,
            quantity: 1,
            allIngredients: const [],
            markedIngredients: const [], // Varsayılan malzemelerle
            note: null,
          ),
        );

    // Opsiyonel: Kullanıcıya bilgi ver
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: HexColor(green),
        content: Text(
          '${product.name} sepete eklendi',
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showProductDetail(BuildContext context, Product product) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => ProductDetailBottomSheet(product: product));
  }
}
