import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screen/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';
enum FilterOptions {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

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
      body: WillPopScope(
        onWillPop:() async {
         
  Navigator.of(context).pop({
    FilterOptions.glutenFree: _glutenFreeFilterSet,
    FilterOptions.lactoseFree: _lactoseFreeFilterSet,
    FilterOptions.vegetarian: _vegetarianFilterSet,
    FilterOptions.vegan: _veganFilterSet,
  });
  return false; // Prevent default pop since you manually popped already



        },
        child: Column(
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
             SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: const Text('Only include Lactose-free meals.'),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: const Text('Only include Vegetarian meals.'),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: const Text('Only include Vegan meals.'),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              
            ),
          ],
        ),
      ),
    );
  }
}
