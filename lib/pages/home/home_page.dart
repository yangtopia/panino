import 'package:flutter/material.dart';

import '../../models/menu.dart';
import '../pages.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentMenu = menus[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SANDYLABS',
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: null)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                currentMenu.name,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                controller:
                    PageController(viewportFraction: 0.9, initialPage: 0),
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.deepOrange.withOpacity(.1)),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: FractionallySizedBox(
                                widthFactor: 0.6,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/${index + 1}.png'),
                                ),
                              )),
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Text(
                            '${menus[index].desc}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey.withOpacity(.4),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RecipePage(currentMenu)));
                                  },
                                  child: Text(
                                    '주문하기',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
