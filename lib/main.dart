import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_grid.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import 'package:meals_app/widgets/meal_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    "glutenFree": false,
    "vegan": false,
    "vegetarian": false,
    "lactoseFree": false
  };

  var availableMeals = DUMMY_MEALS;
  List<Meal> _favourites = [];

  void _setFilters(Map<String, bool> _prFilters) {
    _filters = _prFilters;

    availableMeals = DUMMY_MEALS.where((element) {
      if (_filters["glutenFree"]! && !element.isGlutenFree) return false;
      if (_filters["vegan"]! && !element.isVegan) return false;
      if (_filters["vegetarian"]! && !element.isVegetarian) return false;
      if (_filters["lactoseFree"]! && !element.isLactoseFree) return false;

      return true;
    }).toList();
    //print(availableMeals);
  }

  void _toggleFavourites(String mealId) {
    final existingIndex = _favourites.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favourites.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favourites.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
    print(_favourites);
  }

  bool isFavourite(String id) {
    return _favourites.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(color: Colors.pink),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      //: "/abc",
      //home: CategoriesScreen(),
      routes: {
        "/": (ctx) => TabScreen(_favourites),
        CategoryMeals.route: (ctx) {
          return CategoryMeals(availableMeals);
        },
        MealScreen.routeName: (ctx) {
          return MealScreen(_toggleFavourites, isFavourite);
        },
        FiltersScreen.routeName: (ctx) {
          return FiltersScreen(_filters, _setFilters);
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeliMeals")),
      body: Center(child: Text("Navigation Time!")),
    );
  }
}
