import 'package:flutter/material.dart';

class HomeCategoryChip extends StatelessWidget {
  final bool isSelected ;
  final Map<String, dynamic> item ;
  const HomeCategoryChip({super.key, required this.isSelected, required this.item});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      backgroundColor: isSelected ? Colors.teal.shade500 : Colors.white,
      label: Text(
        item["name"]!,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      avatar: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(item["image"]!),
        backgroundColor: Colors.transparent,
      ),
      side: BorderSide(
        color: isSelected ? Colors.transparent : Colors.black26,
        width: 1.2,
      ),
    );
  }
}
