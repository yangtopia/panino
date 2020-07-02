import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/provider/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final counter2 = Provider.of<Counter2>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('COUNTER1: ${counter.count}')),
          RaisedButton(
            onPressed: () {
              counter.increment();
            },
            child: Text('INCREMENT'),
          ),
          Center(child: Text('COUNTER2: ${counter2.count}')),
          RaisedButton(
            onPressed: () {
              counter2.increment();
            },
            child: Text('INCREMENT'),
          )
        ],
      ),
    );
  }
}
