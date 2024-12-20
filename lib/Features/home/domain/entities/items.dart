class Item {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final String rating;
  final double price;
  final bool isPopular;
  final String description;
  final List<String> allergens;
  final DateTime updatedAt;

  Item({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.rating,
    required this.price,
    required this.isPopular,
    required this.description,
    required this.allergens,
    required this.updatedAt,
  });
}
