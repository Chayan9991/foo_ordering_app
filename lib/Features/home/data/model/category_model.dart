import '../../domain/entities/categories.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String categoryId,
    required String name,
    required String image,
    required DateTime updatedAt,
  }) : super(
    categoryId: categoryId,
    name: name,
    image: image,
    updatedAt: updatedAt,
  );

  // Factory constructor to create a CategoryModel from a Map
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    // Parse the 'updatedAt' to a DateTime from a String or timestamp
    DateTime updatedAt = DateTime.parse(map["updatedAt"]);

    return CategoryModel(
      categoryId: map["categoryId"],
      name: map["name"],
      image: map["image"],
      updatedAt: updatedAt,
    );
  }

  // Method to convert the CategoryModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'image': image,
      'updatedAt': updatedAt.toIso8601String(), // Convert DateTime to String
    };
  }

  // CopyWith method to create a copy of the object with updated fields
  CategoryModel copyWith({
    String? categoryId,
    String? name,
    String? image,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      image: image ?? this.image,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
