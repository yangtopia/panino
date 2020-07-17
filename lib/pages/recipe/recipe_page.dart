import 'package:flutter/material.dart';
import '../../models/menu.dart';

class RecipePage extends StatefulWidget {
  final SandylabsMenu selectedMenu;

  RecipePage([this.selectedMenu]);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문하기'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 8 / 11,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: 8,
            itemBuilder: (_, index) => Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 5 / 3.5,
                        child: Image.asset(
                          'assets/images/${(index) % 3 + 1}.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Text(
                            '양상추',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  print('빼기');
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('1'),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  print('더하기');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
