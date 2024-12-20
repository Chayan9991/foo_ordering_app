import 'package:cafe_menu_app_new/Core/config/routes/app_routes.dart';
import 'package:cafe_menu_app_new/Core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import '../../../cart/presentation/screen/cart_page.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.teal.shade100,
      child: IconButton(
          onPressed: () {
            AppRoutes.push(context, const CartPage());
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: AppPalette.tealGreen,
          )),
    );
  }
}
