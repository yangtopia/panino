import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                print('CLICK NOTI');
              })
        ],
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
