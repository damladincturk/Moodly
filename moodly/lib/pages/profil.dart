import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatelessWidget {
  final double coverHight = 220;
  final double profilHeight = 55;
  final double profilHeight2 = 51;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(children: [
          buildTop(),
          buildContent(),
          SizedBox(height: 20),
          buildButon(),
          SizedBox(height: 160),
        ]));
  }

  buildTop() {
    final double top = coverHight - (profilHeight / 2) - 30;
    final double bottom = profilHeight / 2 + 35;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage(),
          ),
          Positioned(top: top, child: buildProfileImage())
        ]);
  }

  buildCoverImage() => Container(
        color: Colors.grey,
        child: Image(
          image: AssetImage('lib/assets/images/arkaplan.jpeg'),
          width: double.infinity,
          height: coverHight,
          fit: BoxFit.cover,
        ),
      );

  buildProfileImage() => CircleAvatar(
        backgroundColor: Colors.white,
        radius: profilHeight,
        child: CircleAvatar(
          backgroundColor: Colors.amber.shade800,
          radius: profilHeight2,
        ),
      );

  buildContent() => Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("İsim Soyisim",
                  style: GoogleFonts.macondo(
                    fontSize: 30,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Text(
                "Kişisel Bilgiler",
                style: TextStyle(fontSize: 19),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Text(
                  "Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler"),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Text(
                "Sevdiği ve Sevmediği Şeyler",
                style: TextStyle(fontSize: 19),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Text(
                  "Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler Bilgiler"),
            ),
            SizedBox(height: 20),
          ],
        ),
      );

  buildButon() {
    return SizedBox(
      height: 40,
      width: 340,
      child: ElevatedButton(
        onPressed: null,
        child: Text("Güncelle"),
      ),
    );
  }
}
