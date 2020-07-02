import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  List<Widget> pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
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
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
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
