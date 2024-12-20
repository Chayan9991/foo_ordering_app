import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafe_menu_app_new/Core/theme/app_palette.dart';
import 'package:cafe_menu_app_new/Features/home/data/home_item_data.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailedItem extends StatefulWidget {
  final Map<String, dynamic> cardItem;

  const DetailedItem({super.key, required this.cardItem});

  @override
  State<DetailedItem> createState() => _DetailedItemState();
}

class _DetailedItemState extends State<DetailedItem> {
  String selectedSize = "S";
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemCategory = categories
        .where((item) => widget.cardItem["categoryId"] == item["categoryId"])
        .first;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.cardItem["image"],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )
                ],
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.arrow_back),
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.favorite_border_rounded),
                  )),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          widget.cardItem["name"],
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.teal.shade50,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.cardItem["rating"],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.teal),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoChip(
                            Icons.food_bank_outlined, itemCategory["name"]),
                        _buildInfoChip(
                            Icons.local_fire_department_rounded, "450cal"),
                        _buildInfoChip(Icons.timer_outlined, "10-15 min"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    Divider(),
                    ReadMoreText(
                      "${widget.cardItem["description"]} fkasl;kdfj ;klfjaskdf jfahlskj fjdhjs  fdjahsdkjlfh hfjdshflaks fhdkjashfd jhflasjdhf ljkhasdflj asdlf lkajshdfjkahsdflkj lfahdjhfks",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                      lessStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Allergens",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _allergenInfoChip(
                      Icons.coronavirus_outlined,
                      widget.cardItem["allergens"].join(', '),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    //Show this For Specific Items... like Tea, Coffee, Pizzas
                    const Text(
                      "Size",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        _buildSizeButton("S"),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSizeButton("M"),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSizeButton("L"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    const Text(
                      "Extras",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildExtraItem("Extra Cheese", "1.2"),
                    _buildExtraItem("Double Pepperoni", "1.3"),
                    _buildExtraItem("Mushrooms", "2.1"),

                    const SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    const Text(
                      "Customize",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Text Field
                    _customTextField(_textController),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -5))
        ]),
        child: Row(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey),
                ),
                Text(
                  "\$14.99",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.teal),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text("Add To Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildExtraItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.add,
              color: Colors.teal,
              size: 19,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const Spacer(),
          Text(
            "+\$$price",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget _customTextField(TextEditingController textController) {
    return TextField(
      maxLines: 3,
      maxLength: 500,
      controller: textController,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Customize Your Order...",
        hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontSize: 14,
            fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: AppPalette.offWhite,
        filled: true,
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.shade600 : AppPalette.offWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _allergenInfoChip(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        constraints: const BoxConstraints(maxWidth: double.infinity),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.black87,
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              // Wraps the label to avoid overflow
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                overflow:
                    TextOverflow.ellipsis, // Truncates long text with '...'
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppPalette.offWhite,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey[700],
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            label,
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
