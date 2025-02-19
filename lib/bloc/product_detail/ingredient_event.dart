abstract class IngredientEvent {}

class ToggleIngredientEvent extends IngredientEvent {
  final String ingredient;
  ToggleIngredientEvent({required this.ingredient});
}
