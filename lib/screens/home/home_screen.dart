import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../pages/cart_page.dart';
import '../../pages/recipe/recipe_create_page.dart';
import '../../shared/appbar_with_cart.dart';
import 'widgets/flat_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pageViewController =
        PageController(viewportFraction: 0.9, initialPage: 0);

    var currentMenu = menus[_currentIndex];

    void _onTabRecipeCreateButton() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeCreatePage(),
        ),
      );
    }

    void _onTabOrderRecipeButton() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CartPage(), fullscreenDialog: true));
    }

    void _onPageChanged(int value) {
      setState(() {
        _currentIndex = value;
      });
    }

    return Scaffold(
      appBar: AppBarWithCart(
        'SANDYLABS',
        TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
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
                onPageChanged: _onPageChanged,
                controller: _pageViewController,
                itemCount: 3,
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
                                pageViewButton('만들기', _onTabRecipeCreateButton),
                                pageViewButton(
                                    '바로 주문', _onTabOrderRecipeButton),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
