import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id,this.title,this.color});
  void selectCategory(contxt){
   // Navigator.of(contxt).push(MaterialPageRoute(builder: (BuildContext contxt)=>CategoryMealScreen(id,title)));
    Navigator.of(contxt).pushNamed(CategoryMealScreen.categoryMealsRoute,arguments: {"id":id,"title":title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context) ,
        borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          child: Center(child: Text(title)),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [color.withOpacity(.7),color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
            borderRadius: BorderRadius.circular(15),
          )
      ),
    );
  }
}
