import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hedefler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Hedefler();
  }
}

class _Hedefler extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [_buildHedef(), _buildHedef(), _buildHedef()],
        ));
  }

  Container _buildHedef() {
    return Container(
      width: 450,
      height: 150,
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Image(
              image: AssetImage(
                'lib/assets/images/sungerbob.png',
              ),
              width: 100,
              height: 100,
            ),
          ),
          Container(
            width: 250,
            height: 100,
            child: Column(
              children: [
                Text(
                  "Hedef1",
                  style: GoogleFonts.macondo(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "İçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçikİçerikİçerik"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Son Tarih",
                  textAlign: TextAlign.end,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
