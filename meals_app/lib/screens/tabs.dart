import 'package:flutter/material.dart';

import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _Tabs();
  }
}

class _Tabs extends State<Tabs> {
  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const CategoriesScreen();
    String title = 'Categories';

    if (_selectedPageIndex == 1) {
      content = const MealsScreen(
        meals: [],
      );
      title = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
