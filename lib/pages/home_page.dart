import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                child: Column(
                  children: [
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
