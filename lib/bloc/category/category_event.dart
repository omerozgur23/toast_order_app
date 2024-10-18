abstract class CategoryEvent {}

class FetchCategoriesEvent extends CategoryEvent {}

class SelectedCategoryEvent extends CategoryEvent {
  final String categoryId;

  SelectedCategoryEvent(this.categoryId);
}
