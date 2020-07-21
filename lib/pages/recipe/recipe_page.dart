import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

import '../../models/models.dart';
import '../../models/recipe_option.dart';
import 'widgets/recipe_option_card.dart';

class RecipeCreatePage extends StatefulWidget {
  final MenuCategory selectedMenu;

  RecipeCreatePage([this.selectedMenu]);

  @override
  _RecipeCreatePageState createState() => _RecipeCreatePageState();
}

class _RecipeCreatePageState extends State<RecipeCreatePage> {
  final _vegetableOptions = partition(vegetableOptions, 3).toList();
  final _sauceOptions = partition(sauceOptions, 3).toList();

  @override
  void initState() {
    super.initState();
  }

  var _currentBread = '허니오트';
  var _currentCheeze = '아메리칸 치즈';

  void _onChangedBreadDropdown(String bread) {
    setState(() {
      _currentBread = bread;
    });
  }

  void _onChangedCheezeDropdown(String cheeze) {
    setState(() {
      _currentCheeze = cheeze;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 만들기'),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '빵 🥖',
                    style: TextStyle(fontSize: 45.0),
                  ),
                  DropdownButton(
                    items: breadOptions
                        .map((option) => DropdownMenuItem(
                              child: Text(option.title),
                              value: option.title,
                            ))
                        .toList(),
                    value: _currentBread,
                    onChanged: _onChangedBreadDropdown,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '치즈 🧀',
                    style: TextStyle(fontSize: 45.0),
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: cheeseOptions.map<Widget>((cheezeOption) {
                          return Container(
                            child: RecipeOptionCard(cheezeOption),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '야채 🥒',
                    style: TextStyle(fontSize: 45.0),
                  ),
                  Table(
                    children: _vegetableOptions
                        .map((options) {
                          return TableRow(
                              children: options
                                  .map((option) => Container(
                                        child: RecipeOptionCard(option),
                                      ))
                                  .toList());
                        })
                        .toList()
                        .cast<TableRow>(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '소스 🧂',
                    style: TextStyle(fontSize: 45.0),
                  ),
                  Table(
                    children: _sauceOptions
                        .map((options) {
                          return TableRow(
                              children: options
                                  .map((option) => Container(
                                        child: RecipeOptionCard(option),
                                      ))
                                  .toList());
                        })
                        .toList()
                        .cast<TableRow>(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
