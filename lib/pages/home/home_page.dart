import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double appBarBottomRadius = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'SANDYLABS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            floating: true,
            centerTitle: false,
            backgroundColor: Colors.deepOrange,
            expandedHeight: 70.0,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(appBarBottomRadius),
              bottomRight: Radius.circular(appBarBottomRadius),
            )),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('CLICK NOTI');
                  })
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 400,
                // width: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      top: 30,
                      child: Container(
                        height: 350,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Colors.deepOrange.withOpacity(.06),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/${index + 1}.png')),
                      ),
                    ),
                    Positioned(
                        right: 50,
                        top: 75,
                        child: Text(
                          '4,500원',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.deepOrange),
                        )),
                    Positioned(
                        right: 50,
                        top: 150,
                        child: Text(
                          '410 kcal',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.grey),
                        )),
                    Positioned(
                      top: 220,
                      left: 50,
                      child: Container(
                        height: 160,
                        width: 290,
                        // decoration: BoxDecoration(color: Colors.blue),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  '이탈리안 BMT',
                                  style: TextStyle(fontSize: 30.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    '7시간 숙성된 페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화!',
                                    style: TextStyle(color: Colors.black54),
                                    textAlign: TextAlign.justify,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('페퍼로니 3장'),
                                Text('살라미 3장'),
                                Text('햄 2장'),
                                Text('치즈 2장'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }, childCount: 3))
        ],
      ),
    );
  }
}
