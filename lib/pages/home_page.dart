import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         width: 35,
      //         child: Image.asset(
      //           'assets/images/taco.png',
      //           fit: BoxFit.fitWidth,
      //         ),
      //       ),
      //       Padding(padding: EdgeInsets.only(right: 8)),
      //       Text(
      //         'SANDYLABS',
      //         style: TextStyle(
      //             color: Colors.deepOrange, fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.notifications_none),
      //         onPressed: () {
      //           print('CLICK NOTI');
      //         })
      //   ],
      //   centerTitle: false,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                  child: Image.asset(
                    'assets/images/taco.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 8)),
                Text(
                  'SANDYLABS',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            floating: true,
            centerTitle: false,
            // expandedHeight: 100.0,
            backgroundColor: Colors.deepOrange,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset('assets/images/dog.png'),
            // ),
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
            // title: Text('SliverAppBar'),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                child: Column(
                  children: [
                    // FadeInImage.assetNetwork(
                    //   placeholder: 'assets/images/taco.png',
                    //   image:
                    //       'https://i0.wp.com/www.eatthis.com/wp-content/uploads/2019/03/subway-cold-cut-combo-sub.jpg?w=640&ssl=1',
                    //   fit: BoxFit.fill,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '이탈리안 BMT',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₩4200',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }, childCount: 20))
        ],
      ),
    );
  }
}
