abstract class IngredientEvent {}

class ToggleIngredientEvent extends IngredientEvent {
  final String ingredientId;
  ToggleIngredientEvent({required this.ingredientId});
}
