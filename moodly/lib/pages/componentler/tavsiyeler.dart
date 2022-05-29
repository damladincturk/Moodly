import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tavsiyeler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Tavsiyeler();
  }
}

class _Tavsiyeler extends State {
  final List<Widget> tavsiyeList = [
    Row(children: [
      Container(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('lib/assets/images/sungerbob.png'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 255,
              height: 100,
              child: Text(
                  "saçma denemelerdenemelerdenemelerdenemelerdenemelerdenemelerdenemelerdenemelerdenemeler"),
            )
          ],
        ),
      )
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return tavsiyeList[0];
  }
}
