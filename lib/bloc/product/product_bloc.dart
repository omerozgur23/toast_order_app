import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/product/product_event.dart';
import 'package:toast_order_app/bloc/product/product_state.dart';
import 'package:toast_order_app/repository/product_repository.dart';
import 'package:toast_order_app/utilities/exception/error_handler.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductLoading()) {
    on<FetchProductsEvent>(_onFetchProducts);
    on<FetchProductsByCategoryEvent>(_onFecthProductsByCategory);
  }

  Future<void> _onFetchProducts(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await _productRepository.fetchAll();
      emit(ProductLoaded(products));
    } catch (e) {
      final error = ErrorHandler.handleException(e);
      emit(ProductError(error.message));
    }
  }

  Future<void> _onFecthProductsByCategory(
      FetchProductsByCategoryEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products =
          await _productRepository.fetchByCategory(event.categoryId);
      emit(ProductLoaded(products));
    } catch (e) {
      final error = ErrorHandler.handleException(e);
      emit(ProductError(error.message));
    }
  }
}
