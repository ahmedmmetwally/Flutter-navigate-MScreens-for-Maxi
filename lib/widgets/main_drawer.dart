import 'package:flutt_navigation_multi_screens/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listTiltItem(String title, IconData icon, Function tapFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      onTap: tapFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: new Column(
      children: <Widget>[
        new Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking up!",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        listTiltItem("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        SizedBox(
          height: 20,
        ),
        listTiltItem(
            "Filters",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeFilterScreen))
      ],
    ));
  }
}
