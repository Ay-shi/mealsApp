import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({Key? key}) : super(key: key);
  Widget listTileBuilder(IconData icon, String title, VoidCallback navig) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
      onTap: navig,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
          color: Theme.of(context).primaryColor,
          height: 90,
          width: double.infinity,
          child: Text(
            "Cooking Up!!",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondary),
          ),
          alignment: Alignment.centerLeft),
      listTileBuilder(Icons.restaurant_rounded, 'Meals',
          () => Navigator.of(context).pushReplacementNamed("/")),
      listTileBuilder(
          Icons.filter_alt_rounded,
          'Filters',
          () => Navigator.of(context)
              .pushReplacementNamed(FiltersScreen.routeName))
    ]));
  }
}
