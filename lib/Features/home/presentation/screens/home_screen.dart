import 'package:cafe_menu_app_new/Core/common/widgets/custom_text_field.dart';
import 'package:cafe_menu_app_new/Core/theme/app_palette.dart';
import 'package:cafe_menu_app_new/Features/home/data/home_item_data.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/widgets/all_item.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/widgets/cart_icon_button.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/widgets/home_all_contents.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/widgets/home_category_chip.dart';
import 'package:cafe_menu_app_new/Features/home/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Drawer(
          child: Icon(
            Icons.menu_rounded,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CartIconButton(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pico Cafe",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const Text(
              "Pico - Pizzeria & Coffee Bar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Search Box
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ]),
              child: CustomTextField(
                  hintText: "Search your favorite food",
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(
                      onPressed: () {
                        print("filter btn clicked");
                      },
                      icon: const Icon(Icons.filter_alt)),
                  textController: TextEditingController()),
            ),

            // Category item ListView
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: HomeCategoryChip(
                          isSelected: selectedIndex == index,
                          item: categories[index],
                        ),
                      ),
                    );
                  },
                )),

            const SizedBox(
              height: 20,
            ),

            //Navigation
            selectedIndex == 0
                ? AllItems(items: items)
                : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling inside another scrollable view
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10, // Horizontal spacing between items
                mainAxisSpacing: 10, // Vertical spacing between items
                childAspectRatio: 0.73, // Adjust for item height/width ratio
              ),
              itemCount: items
                  .where((item) => item["categoryId"] == categories[selectedIndex]["categoryId"])
                  .length,
              itemBuilder: (context, index) {
                final filteredItems = items
                    .where((item) => item["categoryId"] == categories[selectedIndex]["categoryId"])
                    .toList();
                final item = filteredItems[index];
                return ItemCard(cardItem: item,) ;
              },
            ),

          ],
        ),
      ),
    );
  }
}
