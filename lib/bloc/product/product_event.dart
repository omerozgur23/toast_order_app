abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class FetchProductsByCategoryEvent extends ProductEvent {
  final String categoryId;

  FetchProductsByCategoryEvent(this.categoryId);
}

class UpdateProductQuantityEvent extends ProductEvent {
  final int quantity;

  UpdateProductQuantityEvent(this.quantity);
}
