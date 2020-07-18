import 'package:flutter/material.dart';

FlatButton pageViewButton(String label, Function onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(
      '$label',
      style: TextStyle(fontSize: 20),
    ),
  );
}
