import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/category/category_bloc.dart';
import 'package:toast_order_app/bloc/category/category_state.dart';
import 'package:toast_order_app/utilities/general_utils.dart';
import 'package:toast_order_app/views/home/widgets/category/category_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return GeneralUtils.showCircularProgressIndicator();
        } else if (state is CategoryError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CategoryLoaded) {
          return CategoryList(
            categories: state.categories,
            selectedCategoryId: state.selectedCategoryId,
          );
        } else {
          return const Center(
            child: Text("Kategori bulunamadı"),
          );
        }
      },
    );
  }
}
