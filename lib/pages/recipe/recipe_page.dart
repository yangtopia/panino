import 'package:flutter/material.dart';
import '../../models/menu.dart';

class RecipePage extends StatefulWidget {
  final SandylabsMenu selectedMenu;

  RecipePage([this.selectedMenu]);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('주문하기'),
          elevation: 0,
          centerTitle: false,
        ),
        body: FlatButton(
          child: Text('${widget.selectedMenu?.name ?? 'test'}'),
          onPressed: () {
            print('TEST');
          },
        ));
  }
}
