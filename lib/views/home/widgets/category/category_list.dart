import 'package:flutter/material.dart';
import 'package:toast_order_app/bloc/category/category_bloc.dart';
import 'package:toast_order_app/bloc/category/category_event.dart';
import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/bloc/product/product_event.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/models/category.dart';
import 'package:toast_order_app/views/home/widgets/category/category_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final String? selectedCategoryId;

  const CategoryList({
    Key? key,
    required this.categories,
    this.selectedCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(0.02)),
        margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
        height: context.dynamicHeight(0.09),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: categories.map((category) {
            final isSelected = category.id == selectedCategoryId;
            return CategoryItem(
              category: category,
              isSelected: isSelected,
              onTap: () {
                context
                    .read<CategoryBloc>()
                    .add(SelectedCategoryEvent(category.id));
                context
                    .read<ProductBloc>()
                    .add(FetchProductsByCategoryEvent(category.id));
              },
            );
          }).toList(),
        ));
  }
}
