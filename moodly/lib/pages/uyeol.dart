import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodly/pages/uyelik.dart';
import 'package:moodly/services/auth.dart';

class UyeOl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UyeOl();
  }
}

class _UyeOl extends State {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthServis _authService = AuthServis();

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
                    buildPass(),
                    SizedBox(height: 20),
                    buildPassTekrar(),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: 500,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            _authService
                                .createUser(_emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => uyelikekrani()));
                            });
                          },
                          child: Text("Üyel Ol")),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

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

  buildPass() {
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

  buildPassTekrar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre Tekrar',
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
}
