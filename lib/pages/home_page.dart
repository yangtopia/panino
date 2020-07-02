import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [HomePage(), null, null, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('홈')),
          BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text('동영상')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('좋아요')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('주문내역')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('MY')),
        ],
        fixedColor: Colors.blue,
        currentIndex: _currentPageIndex,
        onTap: _onTab,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  void _onTab(int selectedPageIndex) {
    setState(() {
      _currentPageIndex = selectedPageIndex;
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
    );
  }
}
