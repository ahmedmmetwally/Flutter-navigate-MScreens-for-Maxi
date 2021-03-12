import 'package:flutt_navigation_multi_screens/models/meals.dart';
import 'package:flutt_navigation_multi_screens/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 // final Function removeItem;

  const MealsItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
     // @required this.removeItem
      });

  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Challenging:
        return "challenging";
        break;
      case Complexity.Hard:
        return "hard";
        break;
      default:
        return "unKnown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "affordable";
        break;
      case Affordability.Pricey:
        return "pricey";
        break;
      case Affordability.Luxurious:
        return "expensive";
        break;
      default:
        return "unKnown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.mealDetailRoute,arguments: id).then((result){
     // removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      width: 220,
                      color: Colors.black26,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text("$duration min"),
                  ]),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexitytext),
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
