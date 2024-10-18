import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/bloc/product/product_state.dart';
import 'package:toast_order_app/utilities/exception/error_handler.dart';
import 'package:toast_order_app/utilities/general_utils.dart';
import 'package:toast_order_app/views/home/widgets/product/product_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductError) {
          ErrorHandler.showErrorSnackBar(context, UnknownError(state.message));
        }
      },
      builder: (context, state) {
        if (state is ProductLoading) {
          return GeneralUtils.showCircularProgressIndicator();
        } else if (state is ProductError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProductLoaded) {
          return ProductList(products: state.products);
        } else if (state is ProductError) {
          return const Center(
            child: Center(
                child: Text(
                    "Ürünler yüklenirken bir hata oluştu. Lütfen tekrar deneyin")),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
