import 'package:flutter/material.dart';
import 'dart:ui';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<Login> {
  String _account;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'images/login_logo.png',
              width: 180.0,
              height: 180.0,
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new TextField(
                decoration: InputDecoration(
                  icon: new Icon(
                    Icons.account_circle,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  hintText: '请输入账号',
                  focusedBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor)),
                ),
                onChanged: (String account) {
                  this._account = account;
                },
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new TextField(
                decoration: InputDecoration(
                  icon: new Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  hintText: '请输入密码',
                  border: null,
                  focusedBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor)),
                ),
                obscureText: true,
                onChanged: (String password) {
                  this._password = password;
                },
              ),
            ),
            new Container(
              width: window.physicalSize.width - 80,
              margin: EdgeInsets.only(top: 40.0),
              height: 45.0,
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'farmHome', (route) => route == null);
                },
                color: Theme.of(context).primaryColor,
                child: new Text(
                  '登 录',
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 80.0, left: 40.0, right: 40.0),
      ),
    );
  }
}
