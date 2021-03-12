import 'package:flutt_navigation_multi_screens/dummy_data.dart';
import 'package:flutt_navigation_multi_screens/screens/filters_screen.dart';
import 'package:flutt_navigation_multi_screens/screens/meal_detail_screen.dart';
import 'package:flutt_navigation_multi_screens/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screens.dart';
import './screens/category_meals_screen.dart';
import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _avilableMeal=DUMMY_MEALS;
  List<Meal> _favouriteMeal=[];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avilableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _toggleFavourit(String mealId){
    final existingIndex=_favouriteMeal.indexWhere((meal)=>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    }
    else
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
      });
  }
  bool _isFavourite(String mId){
   return _favouriteMeal.any((meal)=>meal.id==mId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 33,
                  fontFamily: "Piedra",
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreens(),
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreens(_favouriteMeal),
        CategoryMealScreen.categoryMealsRoute: (context) => CategoryMealScreen(_avilableMeal),
        MealDetailScreen.mealDetailRoute:(contex)=>MealDetailScreen(_toggleFavourit,_isFavourite),
        FiltersScreen.routeFilterScreen:(contex)=>FiltersScreen(_filters,_setFilters)
      },
      onGenerateRoute: (setting){
        print(setting.arguments);
        return MaterialPageRoute(builder: (context)=>CategoryMealScreen(_avilableMeal));
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder:(context)=>CategoryMealScreen(_avilableMeal));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: new Center(
        child: Text("Navigation Time"),
      ),
    );
  }
}
