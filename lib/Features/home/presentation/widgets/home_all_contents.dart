import 'package:flutter/material.dart';

class HomeAllContents extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> items;

  const HomeAllContents({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Popular Now",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){},
              child: Container(
                width: 100,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5
                    )
                  ]
                ),
              ),
            );
          },
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
        )
      ],
    );
  }
}
