import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';

class CategoryFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["TV", "Animation", "Games"];
    return Container(
      margin: EdgeInsets.symmetric(vertical: secondDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            CategoryCard(category: categories[index]),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: secondDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: secondDefaultPadding,
        vertical: secondDefaultPadding / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
          color: orange),
      child: Text(
        category,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}