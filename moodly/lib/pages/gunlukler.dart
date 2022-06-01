import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodly/pages/componentler/gunluk.dart';
import 'package:moodly/pages/gunlukekle.dart';

class GunlukSayfasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GunlukSayfasi();
  }
}

class _GunlukSayfasi extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: gunlukgoruntule(),
    );
  }

  SingleChildScrollView gunlukgoruntule() {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 40),
      child: Column(
        children: [
          mydiaries(),
          teknoloji(),
          sanat(),
        ],
      ),
    ));
  }

  mydiaries() {
    return Column(
      children: [
        Text(
          "Teknoloji",
          style: GoogleFonts.macondo(fontSize: 20),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        SizedBox(height: 20),
        Gunluk(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  teknoloji() {
    return Column(
      children: [
        Text(
          "Teknoloji",
          style: GoogleFonts.macondo(fontSize: 20),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        SizedBox(height: 20),
        Gunluk(),
      ],
    );
  }

  sanat() {
    return Column(
      children: [
        Text(
          "Sanat",
          style: GoogleFonts.macondo(fontSize: 20),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        SizedBox(height: 20),
        Gunluk(),
      ],
    );
  }
}
