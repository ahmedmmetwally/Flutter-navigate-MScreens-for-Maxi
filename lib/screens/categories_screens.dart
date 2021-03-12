import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GridView(
        padding: const EdgeInsets.all(15),
    children: DUMMY_CATEGORIES.map((itemCategoryList) {
    return CategoryItem(title:itemCategoryList.title,color: itemCategoryList.color,id:itemCategoryList.id);}
    ).toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20
      ),),
    );
  }
}
