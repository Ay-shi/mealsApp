import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/category_grid.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/drawer_main.dart';

class TabScreen extends StatefulWidget {
  //const TabScreen({ Key? key }) : super(key: key);
  final List<Meal> favourites;

  TabScreen(this.favourites);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPage = 0;
  List<Map<String, Object>> _pages = [];
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavouritesScreen(widget.favourites), 'title': "Favourites"}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPage]['title'] as String)),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outlined),
            label: "Favourites",
          )
        ],
      ),
    );
  }
}

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text('Meals'),
//               bottom: TabBar(tabs: [
//                 Tab(
//                   icon: Icon(Icons.category_outlined),
//                   text: "Categories",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.favorite_outlined),
//                   text: "Favourites",
//                 )
//               ]),
//             ),
//             body: TabBarView(
//               children: [CategoriesScreen(), FavouritesScreen()],
//             )));
//   }
// }
