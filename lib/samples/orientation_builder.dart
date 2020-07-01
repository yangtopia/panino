import 'package:flutter/material.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orientation Builder'),
        ),
        body: Container(
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
                  children: List.generate(50, (index) {
                    return Center(child: Text('Item $index'));
                  }));
            },
          ),
        ));
  }
}
