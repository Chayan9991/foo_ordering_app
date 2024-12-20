import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafe_menu_app_new/Core/config/routes/app_routes.dart';
import 'package:cafe_menu_app_new/Core/theme/app_palette.dart';
import 'package:cafe_menu_app_new/Features/home/data/home_item_data.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/screens/detailed_item.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final Map<String, dynamic> cardItem;
  ItemCard({Key? key, required this.cardItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppRoutes.push(context, DetailedItem(cardItem: cardItem,));
      },
      child: Container(
        height: 210, // Adjusted height
        width: 160, // Width remains the same
        decoration: BoxDecoration(
          color: Colors.white, // Card background
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: cardItem["image"],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
                placeholder: (context, url) {
                  return const Center(
                  child: CircularProgressIndicator(color: AppPalette.tealGreen,), // Placeholder while loading
                );},
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ),

            // Item Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardItem["name"] ?? "Item Name",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4), // Adds spacing between the name and rating
                  Text(
                    "⭐ ${cardItem["rating"] ?? 'N/A'} (234)",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${(cardItem["price"] ?? 0.00).toStringAsFixed(2)}", // Safely handles null and formats the price
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Colors.teal.shade100,
                        ),
                        child: const Icon(Icons.add, color: Colors.teal,),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
