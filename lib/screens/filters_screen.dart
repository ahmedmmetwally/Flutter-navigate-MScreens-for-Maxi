import 'package:flutt_navigation_multi_screens/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeFilterScreen = "/routeFilterScreen";
  final Function saveFilter;
  final Map<String, bool> oldFilter;

  FiltersScreen(this.oldFilter, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.oldFilter["gluten"];
    _vegeterian = widget.oldFilter["vegetarian"];
    _vegan = widget.oldFilter["vegan"];
    _lactoseFree = widget.oldFilter["lactose"];
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool value,
    Function funtion,
  ) {
    return new SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: funtion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("filter Screen"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegeterian,
                };
                widget.saveFilter(_filters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: new Column(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.title,
                )),
            new Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluent_free",
                    "Only include gluent_gree meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "lactose_free",
                    "Only include lactose_gree meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "vegeterian_free",
                    "Only include vegeterian_gree meals",
                    _vegeterian, (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "vegan_free", "Only include vegann_gree meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
