import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TavsiyeSayasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TavsiyeSayfasi();
  }
}

class _TavsiyeSayfasi extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [_buildTavsiye(), _buildTavsiye(), _buildTavsiye()],
        ));
  }

  _buildTavsiye() {
    return Container(
      width: 450,
      height: 80,
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 25),
              child: Icon(Icons.sms_failed)),
          Container(
            width: 250,
            height: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                    "İçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerikİçerik"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tavsiye Tarih,",
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
