import 'package:flutter/material.dart';
import '../../shared/appbar_with_cart.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithCart(
        '주문내역',
      ),
    );
  }
}
