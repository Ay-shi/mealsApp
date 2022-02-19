import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  //  const FavouritesScreen({ Key? key }) : super(key: key);
  List<Meal> favourites;
  FavouritesScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favourites[index].id,
          title: favourites[index].title,
          imageUrl: favourites[index].imageUrl,
          duration: favourites[index].duration,
          complexity: favourites[index].complexity,
          affordability: favourites[index].affordability,
          // remove: _remove,
        );
      },
      itemCount: favourites.length,
    );
  }
}
