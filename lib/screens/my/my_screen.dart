import 'package:flutter/material.dart';
import '../../shared/appbar_with_cart.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithCart(
        '설정',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text(
                            '회원 가입하고',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          Text(
                            '다양한 혜택을 받아보세요!',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('로그인/회원가입'),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[100],
                thickness: 5,
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('비회원 주문 조회'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                color: Colors.grey[100],
                thickness: 5,
              ),
              Column(
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    leading: Icon(Icons.airport_shuttle),
                    title: Text('배송 안내'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('공지사항'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer),
                    title: Text('자주하는 질문'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_phone),
                    title: Text('고객센터'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.restaurant_menu),
                    title: Text('이용안내'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('샌디랩스 소개'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ]).toList(),
              ),
              Divider(
                color: Colors.grey[100],
                thickness: 5,
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('알림 설정'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
