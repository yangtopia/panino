import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  @override
  _MySwipeToDismissState createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {
  final items = List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Swipe To Dismiss')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              direction: DismissDirection.startToEnd,
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              key: Key(item),
              child: ListTile(
                title: Text('${items[index]}'),
              ),
            );
          },
        ));
  }
}
