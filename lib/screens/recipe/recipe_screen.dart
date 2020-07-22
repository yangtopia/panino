import 'package:flutter/material.dart';

import '../../models/recipe.dart';
import '../../pages/recipe/recipe_create_page.dart';
import '../../shared/appbar_with_cart.dart';

class RecipeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    void _onPressAddCartButton() {
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
                onPressed: () {},
                icon: Icon(Icons.airport_shuttle),
                label: Text(
                  '바로 주문',
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

    void _onTabRecipeListItem([Recipe recipe]) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RecipeCreatePage(
            recipe: recipe,
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWithCart(
        '레시피',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '나의 레시피 💁🏻‍♀️',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('나의 레시피 전체보기');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '전체 보기',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: privateMenuOptions.map(
                        (option) => ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(option.name),
                              Text(
                                '₩${option.price}',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          onTap: () {
                            _onTabRecipeListItem(option);
                          },
                          trailing: FlatButton.icon(
                            onPressed: _onPressAddCartButton,
                            icon: Icon(Icons.add),
                            label: Text('담기'),
                          ),
                        ),
                      ),
                    ).toList(),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 5,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '샌드위치 🌮',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: sandwichMenuOptions.map(
                        (option) => ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(option.name),
                                Text(
                                  '₩${option.price}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(option.desc),
                          onTap: () {
                            _onTabRecipeListItem(option);
                          },
                          trailing: FlatButton.icon(
                            onPressed: _onPressAddCartButton,
                            icon: Icon(Icons.add),
                            label: Text('담기'),
                          ),
                        ),
                      ),
                    ).toList(),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 5,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '샐러드 🥗',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: saladMenuOptions.map(
                        (option) => ListTile(
                          isThreeLine: true,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(option.name),
                                Text(
                                  '₩${option.price}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(option.desc),
                          onTap: () {
                            _onTabRecipeListItem(option);
                          },
                          trailing: FlatButton.icon(
                            onPressed: _onPressAddCartButton,
                            icon: Icon(Icons.add),
                            label: Text('담기'),
                          ),
                        ),
                      ),
                    ).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
