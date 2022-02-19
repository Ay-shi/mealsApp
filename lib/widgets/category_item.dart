import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({ Key? key }) : super(key: key);
  final String title;
  final Color colour;
  final String id;
  _SelectCategory(ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMeals.route, arguments: {"title": title, "id": id});
  }

  CategoryItem({required this.title, required this.colour, required this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          child: Text(title, style: Theme.of(context).textTheme.headline6),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              colour.withOpacity(0.5),
              colour.withOpacity(0.7),
              colour
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
