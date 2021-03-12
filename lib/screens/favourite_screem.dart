import 'package:flutt_navigation_multi_screens/widgets/meals_item.dart';
import 'package:flutter/cupertino.dart';
import '../models/meals.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouritList;

  FavouriteScreen(this.favouritList);

  @override
  Widget build(BuildContext context) {
    if(favouritList.isEmpty)return Center(child: Text("you have not favourites yet - start adding sum"),);
    else
    return  ListView.builder(
      itemBuilder: (ctx, index) {
        return MealsItem(
          id: favouritList[index].id,
          title: favouritList[index].title,
          imageUrl: favouritList[index].imageUrl,
          duration: favouritList[index].duration,
          affordability: favouritList[index].affordability,
          complexity: favouritList[index].complexity,
         // removeItem: _removeMeal,
        );
      },
      itemCount: favouritList.length,
    );
     
  }
}
