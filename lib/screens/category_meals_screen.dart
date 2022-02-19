import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const route = "/category_meals";
  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  State<CategoryMeals> createState() => displayedMealsState();
}

class displayedMealsState extends State<CategoryMeals> {
  String? _categoryTitle;
  List<Meal>? displayedMeals;
  @override
  void didChangeDependencies() {
    final _routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    _categoryTitle = _routeArgs["title"];
    final _categoryId = _routeArgs["id"];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(_categoryId);
    }).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _remove(String res) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              // remove: _remove,
            );
          },
          itemCount: displayedMeals!.length,
        ));
  }
}
