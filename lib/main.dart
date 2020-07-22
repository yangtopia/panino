import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'providers/providers.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenIndexProvider()),
      ],
      child: Consumer<ScreenIndexProvider>(
        builder: (context, value, child) {
          return MyApp();
        },
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final pageIndexProvider = Provider.of<ScreenIndexProvider>(context);

    void _onTab(int selectedScreenIndex) {
      pageIndexProvider.changeIndex(ScreenIndex.values[selectedScreenIndex]);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Jua',
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: 'Jua'),
          // backgroundColor: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        body: screens[pageIndexProvider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarItems,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.deepOrange,
          currentIndex: pageIndexProvider.currentIndex.index,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onTab,
        ),
      ),
    );
  }
}
