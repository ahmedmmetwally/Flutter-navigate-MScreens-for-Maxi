import 'package:flutt_navigation_multi_screens/models/meals.dart';
import 'package:flutt_navigation_multi_screens/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories_screens.dart';
import 'favourite_screem.dart';

class TabsScreens extends StatefulWidget {
final List<Meal> favouriteListMeal;

TabsScreens(this.favouriteListMeal);

@override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_pageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pageDataList[_pageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _pageNav,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("category"),backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("favourite"),backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
  List<Map<String, Object>> _pageDataList ;
@override
  void initState(){
  _pageDataList=[
  {"page": CategoriesScreens(), "title": "catergories"},
  {"page": FavouriteScreen(widget.favouriteListMeal), "title": "favourite"}
  ];
  super.initState();
  }
  int _pageIndex = 0;

  void _pageNav(int value) {
    setState(() {
      _pageIndex = value;
    });
  }
}

//how to make viewPager or tabBar.

//@override
//Widget build(BuildContext context) {
//  return DefaultTabController(
//    length: 2,
//    initialIndex: 0,
//    child: Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "meals",
//          style: Theme.of(context).textTheme.title,
//        ),
//        bottom: TabBar(tabs: <Widget>[
//          Tab(icon:Icon(Icons.category),text: "category",),
//          Tab(icon:Icon(Icons.star),text:"favourite")
//        ],),
//      ),
//      body: TabBarView(children: <Widget>[CategoriesScreens(),FavouriteScreen()],),
//    ),
//  );
//}
