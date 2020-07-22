import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../pages/cart_page.dart';

class AppBarWithCart extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle textStyle;
  final double defaultHeight = 56.0;

  AppBarWithCart(this.title, [this.textStyle]);

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CartPage(), fullscreenDialog: true));
    }

    return AppBar(
      title: Text(title, style: textStyle),
      elevation: 0,
      centerTitle: false,
      actions: [
        IconButton(
          icon: Badge(
            toAnimate: false,
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            child: Icon(Icons.shopping_cart),
          ),
          onPressed: _onPressed,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);
}
