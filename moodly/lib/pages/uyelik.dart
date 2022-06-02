import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:moodly/main.dart';
import 'package:moodly/pages/sifre.dart';
import 'package:moodly/pages/uyeol.dart';
import 'package:moodly/services/auth.dart';

class uyelikekrani extends StatefulWidget {
  @override
  _uyelikekraniState createState() => _uyelikekraniState();
}

class _uyelikekraniState extends State<uyelikekrani> {
  bool? isRememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthServis _authService = AuthServis();
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
            ],
          ),
          height: 60,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff0e2f44),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black12),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
            ],
          ),
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff0e2f44),
              ),
              hintText: 'Şifre',
              hintStyle: TextStyle(color: Colors.black12),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildForgotPassButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SifreUnuttum()),
          );
        },
        child: Text(
          'Şifremi Unuttum',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Beni Hatırla',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _authService
              .signIn(_emailController.text, _passwordController.text)
              .then((value) {
            return Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          });
        },
        child: Text(
          'Giriş',
          style: TextStyle(
              backgroundColor: Color.fromARGB(1, 255, 255, 255),
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UyeOl()),
          );
        },
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Üyeliğiniz yok mu?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' Üye Ol',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x665ac18e),
                    Color(0x995ac18e),
                    Color(0xcc5ac18e),
                    Color(0xff5ac18e),
                  ])),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Moodly',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    buildEmail(),
                    SizedBox(height: 20),
                    buildPassword(),
                    buildForgotPassButton(),
                    buildRememberCb(),
                    buildLoginBtn(),
                    buildSignUpBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
