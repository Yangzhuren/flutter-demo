import 'package:flutter/material.dart';
import 'package:flutter_djt/api.dart';
import 'package:flutter_djt/util/http.dart';
import 'dart:ui';

import 'package:flutter_djt/util/text.dart';
import 'package:flutter_djt/util/ui.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<Login> {
  String _account;
  String _password;

  void _login(BuildContext context) {
    if (TextUtil.isEmpty(_account)) {
      AlertUtil.showToast('请输入用户名');
      return;
    }
    if (TextUtil.isEmpty(_password)) {
      AlertUtil.showToast('请输入密码');
      return;
    }
    // map 必须设置泛型，不然post请求会报错，可能是网络请求框架的坑
    Map<String, String> params = {
      'userName': _account,
      'password': _password,
      'pampasCall': Api.apiLogin,
    };
    HttpUtil.post(params, (data) {
      AlertUtil.showToast('动检通欢迎您');
      HttpUtil.sessionId = data['sessionId'];
      Navigator.of(context)
          .pushNamedAndRemoveUntil('farmHome', (route) => route == null);
    }, (error) {
      AlertUtil.showToast(error);
    });
  }

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
                  _login(context);
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
