import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:quiver/core.dart';

import '../../models/models.dart';
import '../../models/recipe.dart';
import '../../models/recipe_option.dart';
import '../cart_page.dart';
import 'widgets/recipe_option_card.dart';

class RecipeCreatePage extends StatefulWidget {
  final Recipe recipe;

  RecipeCreatePage({this.recipe});

  @override
  _RecipeCreatePageState createState() => _RecipeCreatePageState();
}

class _RecipeCreatePageState extends State<RecipeCreatePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _vegetableOptions = partition(vegetableOptions, 3).toList();
  final _sauceOptions = partition(sauceOptions, 3).toList();

  String _currentBreadOptionId;
  bool _isEditable = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isEditable = Optional.fromNullable(widget.recipe).isNotEmpty;
      _currentBreadOptionId = widget.recipe?.breadOptionId ?? 'b1';
    });
  }

  void _onChangedBreadDropdown(String breadOptionId) {
    setState(() {
      _currentBreadOptionId = breadOptionId;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onPressedSnackbarButton() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CartPage(), fullscreenDialog: true),
      );
    }

    void _onPressAppBarActionButton() {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '장바구니에 추가되었습니다 🥪',
                style: TextStyle(fontSize: 17.0),
              ),
              FlatButton.icon(
                onPressed: _onPressedSnackbarButton,
                icon: Icon(Icons.airport_shuttle),
                label: Text(
                  '장바구니 이동',
                  style: TextStyle(fontFamily: 'Jua'),
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          '레시피 만들기',
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          FlatButton.icon(
            onPressed: _onPressAppBarActionButton,
            icon: Icon(Icons.add),
            label: Text(
              '담기',
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '빵 🥖',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                        items: breadOptions
                            .map((option) => DropdownMenuItem(
                                  child: Text(option.title),
                                  value: option.id,
                                ))
                            .toList(),
                        value: _currentBreadOptionId,
                        onChanged: _onChangedBreadDropdown,
                      ),
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
                    '치즈 🧀',
                    style: TextStyle(fontSize: 24.0),
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
                    '고기 🥓',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: meatOptions.map<Widget>((cheezeOption) {
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
                    style: TextStyle(fontSize: 24.0),
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
                    style: TextStyle(fontSize: 24.0),
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
            // Container(
            //   padding: EdgeInsets.all(16.0).add(EdgeInsets.only(bottom: 16.0)),
            //   child: ButtonTheme(
            //     minWidth: double.infinity,
            //     buttonColor: Colors.amber,
            //     child: RaisedButton(
            //       onPressed: () {
            //         print('레시피 추가');
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text(
            //           '레시피 추가',
            //           style: TextStyle(fontSize: 30.0),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
