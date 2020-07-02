import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/bloc/index.dart';
import 'state/provider/index.dart';

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

PageIndexBloc pageIndexBloc = PageIndexBloc();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onTab(int selectedPageIndex) {
      pageIndexBloc.changePageIndex(selectedPageIndex);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<PageIndex>(
          stream: pageIndexBloc.pageIndexStream$,
          initialData: PageIndex.home,
          builder: (context, snapshot) {
            return Scaffold(
              body: pages[snapshot.data],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('홈')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.movie), title: Text('오늘 뭐먹지')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), title: Text('좋아요')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), title: Text('주문내역')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info), title: Text('MY')),
                ],
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.blue,
                currentIndex: snapshot.data.index,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                onTap: _onTab,
              ),
            );
          }),
    );
  }
}
