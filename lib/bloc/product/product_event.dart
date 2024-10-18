abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class FetchProductsByCategoryEvent extends ProductEvent {
  final String categoryId;

  FetchProductsByCategoryEvent(this.categoryId);
}
