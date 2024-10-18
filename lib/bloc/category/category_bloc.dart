import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/category/category_event.dart';
import 'package:toast_order_app/bloc/category/category_state.dart';
import 'package:toast_order_app/repository/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryLoading()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<SelectedCategoryEvent>(_onSelectCategory);
  }

  Future<void> _onFetchCategories(
      FetchCategoriesEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());
      final categories = await _categoryRepository.fetchAll();
      emit(CategoryLoaded(categories,
          selectedCategoryId:
              categories.isNotEmpty ? categories.first.id : null));
    } catch (e) {
      emit(CategoryError("Kategoriler yüklenemedi: $e"));
    }
  }

  void _onSelectCategory(
      SelectedCategoryEvent event, Emitter<CategoryState> emit) {
    if (state is CategoryLoaded) {
      final currentState = state as CategoryLoaded;
      emit(CategoryLoaded(currentState.categories,
          selectedCategoryId: event.categoryId));
    }
  }
}
