import 'package:flutter/material.dart';
import '../../shared/appbar_with_cart.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithCart(
        '설정',
      ),
    );
  }
}
