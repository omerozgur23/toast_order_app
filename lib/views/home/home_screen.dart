import 'package:flutter/material.dart';
import 'package:toast_order_app/bloc/category/category_bloc.dart';
import 'package:toast_order_app/bloc/category/category_event.dart';
import 'package:toast_order_app/bloc/category/category_state.dart';
import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/bloc/product/product_event.dart';
import 'package:toast_order_app/views/home/widgets/carousel/carousel_slider_widget.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/views/home/widgets/category/category_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/views/home/widgets/product/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(FetchCategoriesEvent());
    return BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoaded) {
            String selectedCategoryId =
                state.selectedCategoryId ?? 'default_category_id';
            context
                .read<ProductBloc>()
                .add(FetchProductsByCategoryEvent(selectedCategoryId));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeightSpace(context.dynamicHeight(0.01)),
              const CarouselSliderWidget(),
              const CategoryScreen(),
              _buildHeightSpace(context.dynamicHeight(0.02)),
              const ProductScreen()
            ],
          ),
        ));
  }

  SizedBox _buildHeightSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}
