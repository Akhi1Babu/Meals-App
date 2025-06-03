import 'package:flutter/material.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  var  activepageTitle = "Categories";

  void _selectPageIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
 
    Widget activePageIndex = CategoriesScreen();
     if (_selectedIndex == 1) {  
      // Load Settings Page
      activepageTitle = "your favourite meals";
      activePageIndex = Meals(title: "Favourite", meals: []);
      
    }
    return Scaffold(appBar: AppBar(
      title: Text(activepageTitle),
    ),
    body: activePageIndex,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Catgeories'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
      ],
      onTap: _selectPageIndex,
       
        
      ),
    );
  }
}