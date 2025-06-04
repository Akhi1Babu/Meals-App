import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;
  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
              children: [
                Icon(Icons.fastfood, size: 50, color: Theme.of(context).colorScheme.onPrimaryContainer),
                SizedBox(width: 20),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),  
              ],
          )),
          ListTile(
            leading: Icon(Icons.restaurant, color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 25
              ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
             ListTile(
            leading: Icon(FontAwesomeIcons.filter, size: 20
            , color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 25
              ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
      ],)
    );
  }
}