import 'package:flutter/material.dart';
import '../../models/menu.dart';

List<SandylabsMenu> menus = [
  SandylabsMenu(
      'm1',
      '샌드위치',
      '7시간 숙성된 페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화! 전세계가 사랑하는 No.1 베스트셀러!',
      410,
      4500),
  SandylabsMenu(
      'm2', '랩', '친환경 인증 받은 농장에서 생산된 달걀과 고소한 마요네즈가 만나 더 부드러운 스테디셀러', 520, 4500),
  SandylabsMenu(
      'm3', '샐러드', '남녀노소 누구나 좋아하는 담백한 참치와 고소한 마요네즈의 완벽한 조화', 200, 3000),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentMenuName = menus[_currentIndex].name;
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
                currentMenuName,
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
                                  onPressed: () => print('주문하기'),
                                  child: Text(
                                    '주문하기',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () => print('장바구니'),
                                  child: Text(
                                    '장바구니',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
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
