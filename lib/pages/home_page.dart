import 'package:flutter/material.dart';
import 'package:panino/provider/counter2.dart';
import 'package:provider/provider.dart';

import '../bloc/page_index_bloc.dart';
import '../provider/counter.dart';

final List<Widget> _pages = [HomePage(), null, null, null, null];
PageIndexBloc pageIndexBloc = PageIndexBloc();

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: pageIndexBloc.pageIndexStream$,
        builder: (context, snapshot) {
          return Scaffold(
            body: _pages[snapshot.data],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('홈')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie), title: Text('동영상')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), title: Text('좋아요')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), title: Text('주문내역')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info), title: Text('MY')),
              ],
              fixedColor: Colors.blue,
              currentIndex: snapshot.data,
              onTap: _onTab,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
            ),
          );
        });
  }

  void _onTab(int selectedPageIndex) {
    pageIndexBloc.changePageIndex(selectedPageIndex);
  }
}

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
