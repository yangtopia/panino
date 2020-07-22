import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

import '../../models/models.dart';
import '../../models/recipe_option.dart';
import '../cart_page.dart';
import 'widgets/recipe_option_card.dart';

class RecipeCreatePage extends StatefulWidget {
  final MenuCategory selectedMenu;

  RecipeCreatePage([this.selectedMenu]);

  @override
  _RecipeCreatePageState createState() => _RecipeCreatePageState();
}

class _RecipeCreatePageState extends State<RecipeCreatePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _vegetableOptions = partition(vegetableOptions, 3).toList();
  final _sauceOptions = partition(sauceOptions, 3).toList();

  @override
  void initState() {
    super.initState();
  }

  var _currentBread = '허니오트';

  void _onChangedBreadDropdown(String bread) {
    setState(() {
      _currentBread = bread;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onPressedSnackbarButton() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CartPage(), fullscreenDialog: true),
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
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '레시피가 저장되었습니다 🥪',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      FlatButton.icon(
                          onPressed: _onPressedSnackbarButton,
                          icon: Icon(Icons.airport_shuttle),
                          label: Text(
                            '바로 주문',
                            style: TextStyle(fontFamily: 'Jua'),
                          ))
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                ),
              );
            },
            icon: Icon(Icons.save_alt),
            label: Text(
              '저장',
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
