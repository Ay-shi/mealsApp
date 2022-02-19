import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  static const String routeName = "/meal_screen";
  final Function favouriteSelect;
  final Function isFavourite;
  MealScreen(this.favouriteSelect, this.isFavourite);

//   @override
//   State<MealScreen> createState() => _MealScreenState();
// }

// class _MealScreenState extends State<MealScreen> {

  Widget BuildSectionTitle(BuildContext ctx, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.headline6,
        ));
  }

  Widget BuildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
      height: 200,
      width: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final SelectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child:
              isFavourite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: () {
            favouriteSelect(mealId);
          }),
      // child: Icon(Icons.delete),
      // onPressed: () {
      //   Navigator.of(context).pop(mealId);
      // }),
      appBar: AppBar(title: Text(SelectedMeal.title)),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(SelectedMeal.imageUrl, fit: BoxFit.cover),
          padding: EdgeInsets.all(10),
        ),
        BuildSectionTitle(context, "Ingredients"),
        BuildContainer(
            context,
            ListView.builder(
                itemBuilder: (cntxt, indx) {
                  return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(SelectedMeal.ingredients[indx]),
                      ));
                },
                itemCount: SelectedMeal.ingredients.length)),
        BuildSectionTitle(context, "Steps"),
        BuildContainer(
            context,
            ListView.separated(
                separatorBuilder: (cntxt, indx) {
                  return const Divider();
                },
                itemBuilder: (cntxt, indx) {
                  return ListTile(
                    leading: CircleAvatar(child: Text("# ${indx + 1}")),
                    title: Text(SelectedMeal.steps[indx]),
                  );
                },
                itemCount: SelectedMeal.steps.length)),
        const SizedBox(
          height: 30,
        )
      ])),
    );
  }
}
