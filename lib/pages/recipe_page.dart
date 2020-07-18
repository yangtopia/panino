import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeCreatePage extends StatefulWidget {
  final MenuCategory selectedMenu;

  RecipeCreatePage([this.selectedMenu]);

  @override
  _RecipeCreatePageState createState() => _RecipeCreatePageState();
}

class _RecipeCreatePageState extends State<RecipeCreatePage> {
  var _currentBread = '허니오트';
  var _currentCheeze = '아메리칸 치즈';

  void _onChangedBreadDropdown(String bread) {
    setState(() {
      _currentBread = bread;
    });
  }

  void _onChangedCheezeDropdown(String cheeze) {
    setState(() {
      _currentCheeze = cheeze;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 만들기'),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#빵',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text('허니오트'),
                        value: '허니오트',
                      ),
                      DropdownMenuItem(child: Text('하티'), value: '하티'),
                      DropdownMenuItem(child: Text('위트'), value: '위트'),
                      DropdownMenuItem(
                          child: Text('파마산 오레가노'), value: '파마산 오레가노'),
                      DropdownMenuItem(child: Text('화이트'), value: '화이트'),
                    ],
                    value: _currentBread,
                    onChanged: _onChangedBreadDropdown,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#치즈',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Table(
                    children: List.generate(1, (rowIndex) {
                      return TableRow(
                        children: List.generate(
                          3,
                          (columIndex) => Container(
                            // height: 150,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 5 / 3.5,
                                    child: Image.asset(
                                      'assets/images/${columIndex + 1}.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        '양상추',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         '#치즈 선택',
            //         style: Theme.of(context).textTheme.headline3,
            //       ),
            //       DropdownButton(
            //         items: [
            //           DropdownMenuItem(
            //             child: Text('아메리칸 치즈'),
            //             value: '아메리칸 치즈',
            //           ),
            //           DropdownMenuItem(child: Text('슈레드 치즈'), value: '슈레드 치즈'),
            //           DropdownMenuItem(
            //               child: Text('모짜렐라 치즈'), value: '모짜렐라 치즈'),
            //         ],
            //         value: _currentCheeze,
            //         onChanged: _onChangedCheezeDropdown,
            //       )
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#야채',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Table(
                    children: List.generate(3, (rowIndex) {
                      return TableRow(
                        children: List.generate(
                          3,
                          (columIndex) => Container(
                            // height: 150,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 5 / 3.5,
                                    child: Image.asset(
                                      'assets/images/${columIndex + 1}.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        '양상추',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#소스',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Table(
                    children: List.generate(1, (rowIndex) {
                      return TableRow(
                        children: List.generate(
                          3,
                          (columIndex) => Container(
                            // height: 150,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 5 / 3.5,
                                    child: Image.asset(
                                      'assets/images/${columIndex + 1}.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        '양상추',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
