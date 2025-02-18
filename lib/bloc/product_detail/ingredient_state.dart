class IngredientState {
  final bool isMarked;

  IngredientState({required this.isMarked});

  IngredientState copyWith({bool? isMarked}) {
    return IngredientState(isMarked: isMarked ?? this.isMarked);
  }
}
