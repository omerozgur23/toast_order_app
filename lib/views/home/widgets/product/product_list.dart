import 'package:flutter/material.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:toast_order_app/views/home/widgets/product/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        // final product = products[index];
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.dynamicHeight(0.01),
              horizontal: context.dynamicWidth(0.03)),
          child: ProductItem(product: products[index]),
        );
      },
    );
  }
}
