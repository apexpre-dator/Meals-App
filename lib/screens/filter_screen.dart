import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-free'),
                  value: glutenFree,
                  subtitle: Text('Only include Gluten-free food'),
                  onChanged: (newVal) {
                    setState(() {
                      glutenFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: vegetarian,
                  subtitle: Text('Only include Vegetarian food'),
                  onChanged: (newVal) {
                    setState(() {
                      vegetarian = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: vegan,
                  subtitle: Text('Only include Vegan food'),
                  onChanged: (newVal) {
                    setState(() {
                      vegan = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  value: lactoseFree,
                  subtitle: Text('Only include Lactose-free food'),
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
