import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SnackBar'),
        ),
        body: Builder(
            builder: (context) => Center(
                    child: RaisedButton(
                  onPressed: () {
                    final snackbar = SnackBar(
                      content: Text('메일이 삭제되었습니다.'),
                      action: SnackBarAction(label: '취소', onPressed: () {
                        // Navigator.of(context).pop();
                      }),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                  child: Text('Show SnackBar'),
                ))));
  }
}
