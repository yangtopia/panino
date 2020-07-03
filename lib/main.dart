import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'state/provider/index.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageIndexProvider()),
      ],
      child: Consumer<PageIndexProvider>(
        builder: (context, value, child) {
          return MyApp();
        },
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final pageIndexProvider = Provider.of<PageIndexProvider>(context);

    void _onTab(int selectedPageIndex) {
      pageIndexProvider.changeIndex(selectedPageIndex);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            body: pages[pageIndexProvider.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.deepOrange,
              currentIndex: pageIndexProvider.currentIndex.index,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onTab,
            )));
  }
}
