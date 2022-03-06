import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen({required this.currentFilters, required this.saveFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'] as bool;
    vegetarian = widget.currentFilters['vegetarian'] as bool;
    vegan = widget.currentFilters['vegan'] as bool;
    lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.saveFilters({
                'gluten': glutenFree,
                'vegetarian': vegetarian,
                'vegan': vegan,
                'lactose': lactoseFree,
              });
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Gluten-free'),
                  value: glutenFree,
                  subtitle: const Text('Only include Gluten-free food'),
                  onChanged: (newVal) {
                    setState(() {
                      glutenFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  value: vegetarian,
                  subtitle: const Text('Only include Vegetarian food'),
                  onChanged: (newVal) {
                    setState(() {
                      vegetarian = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  value: vegan,
                  subtitle: const Text('Only include Vegan food'),
                  onChanged: (newVal) {
                    setState(() {
                      vegan = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-free'),
                  value: lactoseFree,
                  subtitle: const Text('Only include Lactose-free food'),
                  onChanged: (newVal) {
                    setState(() {
                      lactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
