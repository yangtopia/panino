import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'provider/counter.dart';
import 'provider/counter2.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter()),
          ChangeNotifierProvider(create: (context) => Counter2())
        ],
        child: Consumer2<Counter, Counter2>(
          builder: (context, value, value2, child) {
            return MyApp();
          },
        )));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
