import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //     appBar: AppBar(title: Text("DeliMeals")),
        //     body:
        GridView(
      padding: const EdgeInsets.all(10),
      children: DUMMY_CATEGORIES
          .map((item) =>
              CategoryItem(title: item.title, colour: item.colour, id: item.id))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
