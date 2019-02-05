import 'package:flutter/material.dart';
import 'package:app1/mvp/pages/login/login_page_contract.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements  LoginPageContract{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Container(
        child: Center(
          child: Text("Login Page"),
        ),
      ),
    );
  }

  @override
  void onLoginSuccess(){

  }

  @override
  void onLoginError(){

  }

}