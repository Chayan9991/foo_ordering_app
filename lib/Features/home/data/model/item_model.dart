
import '../../domain/entities/items.dart';  // Assuming the 'Item' class is in this location.

class ItemModel extends Item {
    ItemModel({
        required super.id,
        required super.name,
        required super.categoryId,
        required super.image,
        required super.rating,
        required super.price,
        required super.isPopular,
        required super.description,
        required super.allergens,
        required super.updatedAt,
    });

    // Factory constructor to create an ItemModel from a Map
    factory ItemModel.fromMap(Map<String, dynamic> map) {
        return ItemModel(
            id: map["id"],
            name: map["name"],
            categoryId: map["categoryId"],
            image: map["image"],
            rating: map["rating"],
            price: map["price"].toDouble(),  // Assuming price is stored as a number
            isPopular: map["isPopular"],
            description: map["description"],
            allergens: List<String>.from(map["allergens"]),
            updatedAt: DateTime.parse(map["updatedAt"]), // Parsing updatedAt to DateTime
        );
    }

    // Method to convert the ItemModel to a Map
    Map<String, dynamic> toMap() {
        return {
            "id": id,
            "name": name,
            "categoryId": categoryId,
            "image": image,
            "rating": rating,
            "price": price,
            "isPopular": isPopular,
            "description": description,
            "allergens": allergens,
            "updatedAt": updatedAt.toIso8601String(), // Convert DateTime to String
        };
    }

    // CopyWith method to create a copy of the object with updated fields
    ItemModel copyWith({
        int? id,
        String? name,
        int? categoryId,
        String? image,
        String? rating,
        double? price,
        bool? isPopular,
        String? description,
        List<String>? allergens,
        DateTime? updatedAt,
    }) {
        return ItemModel(
            id: id ?? this.id,
            name: name ?? this.name,
            categoryId: categoryId ?? this.categoryId,
            image: image ?? this.image,
            rating: rating ?? this.rating,
            price: price ?? this.price,
            isPopular: isPopular ?? this.isPopular,
            description: description ?? this.description,
            allergens: allergens ?? this.allergens,
            updatedAt: updatedAt ?? this.updatedAt,
        );
    }
}
