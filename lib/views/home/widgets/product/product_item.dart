import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/product.dart';
import 'package:toast_order_app/utilities/general_utils.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                product.imagePath,
                width: context.dynamicWidth(0.29),
                height: context.dynamicHeight(0.135),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: context.dynamicWidth(0.03)),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GeneralUtils.capitalizeWords(product.name),
                      style: TextStyle(
                          fontSize: context.dynamicHeight(0.017),
                          fontWeight: FontWeight.bold,
                          color: HexColor(black)),
                    ),
                    Text(
                      product.description
                          .join(', '), // Burada virgülle ayırıyoruz
                      style: TextStyle(
                        fontSize: context.dynamicHeight(0.012),
                        color: HexColor(grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price.toStringAsFixed(2)} TL',
                      style: TextStyle(
                          fontSize: context.dynamicHeight(0.018),
                          fontWeight: FontWeight.bold,
                          color: HexColor(black)),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor(white),
                            padding: EdgeInsets.symmetric(
                                horizontal: context.dynamicWidth(0.04),
                                vertical: context.dynamicHeight(0.01)),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: HexColor(yellow), width: 1.0),
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Text(
                          "Sipariş Ver",
                          style: TextStyle(
                              fontSize: context.dynamicHeight(0.014),
                              color: HexColor(black)),
                        ))
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
