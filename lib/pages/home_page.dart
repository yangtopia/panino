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
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 35,
              child: Image.asset(
                'assets/images/taco.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
            Text(
              'SANDYLABS',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {
            print('CLICK NOTI');
          })
        ],
        centerTitle: false,
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
