import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_main.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({ Key? key }) : super(key: key);
  static const routeName = "/filter_screen";
  final Function(Map<String, bool>) setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters["glutenFree"]!;
    _vegetarian = widget.filters["vegetarian"]!;
    _vegan = widget.filters["vegan"]!;
    _lactoseFree = widget.filters["lactoseFree"]!;

    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(bool current, String title, String description,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: current,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"), actions: [
        IconButton(
            onPressed: () {
              widget.setFilters({
                "glutenFree": _glutenFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
                "lactoseFree": _lactoseFree
              });
            },
            icon: Icon(Icons.save_rounded))
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  _glutenFree,
                  "Gluten-Free",
                  "Only gluten free meals",
                  (newValue) => {
                        setState(() {
                          _glutenFree = newValue;
                        }),
                      }),
              _buildSwitchListTile(
                  _vegan,
                  "Vegan",
                  "Only vegan meals",
                  (newValue) => {
                        setState(() {
                          _vegan = newValue;
                        }),
                      }),
              _buildSwitchListTile(
                  _vegetarian,
                  "Vegetarian",
                  "Only vegetarian meals",
                  (newValue) => {
                        setState(() {
                          _vegetarian = newValue;
                        }),
                      }),
              _buildSwitchListTile(
                  _lactoseFree,
                  "Lactose-Free",
                  "Only lactose free meals",
                  (newValue) => {
                        setState(() {
                          _lactoseFree = newValue;
                        }),
                      })
            ],
          ))
        ],
      ),
    );
  }
}
