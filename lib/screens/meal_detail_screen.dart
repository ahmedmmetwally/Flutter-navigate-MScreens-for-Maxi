import 'package:flutt_navigation_multi_screens/models/meals.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const mealDetailRoute = "/mealDetailRoute";
  final Function toggleFavourite;
  final Function isFavourit;


  MealDetailScreen(this.toggleFavourite, this.isFavourit);

  Widget buildTitle(BuildContext contxt, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(contxt).textTheme.title,
      ),
    );
  }

  Widget buildContaierList(Widget widget) {
    return Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        padding: EdgeInsets.all(5),
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    final  mealList = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: FittedBox(child: Text("${mealList.title}"))),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(mealList.imageUrl),
            ),
            buildTitle(context, "ingredients"),
            buildContaierList(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(mealList.ingredients[index]),
                ),
              ),
              itemCount: mealList.ingredients.length,
            )),
            buildTitle(context, "steps"),
            buildContaierList(
              ListView.builder(
                  itemBuilder: (context, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("# ${index + 1}"),
                            ),
                            title: Text(mealList.steps[index]),
                          ),
                          Divider(
                            color: Colors.brown,
                          )
                        ],
                      ),
                  itemCount: mealList.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavourit(mealId)? Icon(Icons.star):Icon(Icons.star_border),
        onPressed: ()=>toggleFavourite(mealId),
      ),
    );
  }
}
