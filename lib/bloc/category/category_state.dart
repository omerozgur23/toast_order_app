import 'package:toast_order_app/models/category.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  final String? selectedCategoryId;

  CategoryLoaded(this.categories, {this.selectedCategoryId});
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
