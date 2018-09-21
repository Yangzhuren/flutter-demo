import 'package:flutter/material.dart';

class AlertUtil {
  static void showToast(String message) {
    new AlertDialog(
      title: new Text(message),
      actions: <Widget>[
        new RaisedButton(child: new Text('confirm'), onPressed: () {})
      ],
    );
  }
}
