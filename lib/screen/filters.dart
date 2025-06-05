import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screen/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.pop(context); // Close the drawer
        if (identifier == 'meals') {
          Navigator.pop(context); // Close the drawer
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TabScreen()));
        } else if (identifier == 'filters') {
          Navigator.pop(context); // Close the drawer
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FiltersScreen()));
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface
              ),
            ),
            subtitle: const Text('Only include gluten-free meals.'),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.only(left: 34, right: 20),
            
          ),
        ],
      ),
    );
  }
}
