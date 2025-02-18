class Product {
  final String id;
  final String name;
  final List<String> description;
  final double price;
  final String imagePath;
  final bool directCartBtn;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.directCartBtn});
}
