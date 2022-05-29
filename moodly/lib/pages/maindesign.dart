import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodly/pages/componentler/tavsiyeler.dart';

import 'componentler/gunluk.dart';

class MainDesign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainDesign();
  }
}

final kutuStyle = BoxDecoration(
  color: Colors.yellowAccent[100],
  border: Border(
    top: BorderSide(width: 2.0, color: Color.fromARGB(255, 255, 240, 1)),
    bottom: BorderSide(width: 2.0, color: Color.fromARGB(255, 255, 240, 1)),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ],
);

Color blue = new Color.fromARGB(255, 3, 4, 5);
final List<Widget> modlarList = [
  Column(
    children: [
      Text(
        "Çok Üzgün",
        style: GoogleFonts.macondo(),
      ),
      IconButton(
        onPressed: null,
        icon: Image.asset('lib/assets/icons/cokuzgun.png'),
      ),
    ],
  ),
  SizedBox(
    width: 10,
  ),
  Column(
    children: [
      Text("Üzgün", style: GoogleFonts.macondo()),
      IconButton(
        onPressed: null,
        icon: Image.asset('lib/assets/icons/uzgun.png'),
      ),
    ],
  ),
  SizedBox(
    width: 10,
  ),
  Column(
    children: [
      Text("Normal", style: GoogleFonts.macondo()),
      IconButton(
        onPressed: null,
        icon: Image.asset('lib/assets/icons/normal.png'),
      ),
    ],
  ),
  SizedBox(
    width: 10,
  ),
  Column(
    children: [
      Text("Mutlu", style: GoogleFonts.macondo()),
      IconButton(
        onPressed: null,
        icon: Image.asset('lib/assets/icons/mutlu.png'),
      ),
    ],
  ),
  SizedBox(
    width: 10,
  ),
  Column(
    children: [
      Text("Çok Mutlu", style: GoogleFonts.macondo()),
      IconButton(
        onPressed: null,
        icon: Image.asset('lib/assets/icons/cokmutlu.png'),
        tooltip: 'Çok Üzgün',
      ),
    ],
  ),
];

class _MainDesign extends State {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
      child: Column(
        children: [
          //takvim
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 6,
                child: Container(
                  child: DatePicker(
                    DateTime.now(),
                    //width: 70,
                    height: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: blue,
                    selectedTextColor: Colors.amber,
                    dateTextStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(fit: FlexFit.tight, flex: 1, child: SizedBox()),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                    onPressed: () {},
                  ))
            ],
          ),
          SizedBox(height: 10),
          //alan1
          Row(children: [
            Flexible(
                fit: FlexFit.tight,
                child: Container(
                    height: 170,
                    decoration: kutuStyle,
                    child: Column(children: [
                      Flexible(
                          child: Center(
                              child: Text("Bugün Nasılsın?",
                                  style: GoogleFonts.macondo(
                                    fontSize: 25,
                                  )))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(left: 45),
                              child: Row(
                                children: modlarList,
                              ))),
                      SizedBox(height: 20)
                    ])))
          ]),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "Tavsiyeler",
                    style: GoogleFonts.macondo(fontSize: 25),
                  )),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Divider(
                    thickness: 3,
                    indent: 20,
                    endIndent: 20,
                    color: Color.fromARGB(128, 72, 74, 74),
                  ))
            ],
          ),
          //alan2
          Row(children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 18, top: 15, bottom: 10),
                child: Column(
                  children: [Tavsiyeler(), SizedBox(height: 15), Tavsiyeler()],
                ),
              ),
            )
          ]),
          SizedBox(height: 10),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                child: Text(
                  "Hedefler",
                  style: GoogleFonts.macondo(fontSize: 25),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Divider(
                    thickness: 3,
                    indent: 20,
                    endIndent: 20,
                    color: Color.fromARGB(128, 72, 74, 74),
                  ))
            ],
          ),
          //alan3
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 18, top: 15, bottom: 10),
                  child: Column(
                    children: [
                      Tavsiyeler(),
                      SizedBox(height: 15),
                      Tavsiyeler()
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.only(
                        top: 25, left: 20, right: 20, bottom: 25),
                    decoration: kutuStyle,
                    child: Column(
                      children: [
                        Container(
                            child: Text("Günlükler",
                                style: GoogleFonts.macondo(
                                  fontSize: 25,
                                ))),
                        SizedBox(height: 25),
                        Container(
                            child: Row(
                          children: [Gunluk()],
                        ))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text("alan5"),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text("alan6"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
