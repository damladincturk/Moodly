import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Gunluk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    FirebaseFirestore.instance.collection('generaldiaries').snapshots();
    return _Gunluk();
  }
}

class CartItem {
  final AssetImage urlImage;
  final String title;
  final String content;

  const CartItem(
      {required this.urlImage, required this.title, required this.content});
}

class _Gunluk extends State {
  List<CartItem> items = [
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerikk"),
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerik"),
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerik"),
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerik"),
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerik"),
    CartItem(
        urlImage: AssetImage('lib/assets/images/sungerbob.png'),
        title: "Deneme",
        content: "İçerik içerik içerik deneme içerik"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370,
        height: 230,
        child: Flexible(
            child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 10,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return buildCard(item: items[index]);
          },
          itemCount: 6,
        )));
  }

  buildCard({required CartItem item}) {
    return Container(
      width: 100,
      height: 200,
      child: Column(
        children: [
          Container(
            child: Image(
              image: item.urlImage,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 30,
            child: Text(item.title),
          ),
          Container(height: 100, child: Text(item.content))
        ],
      ),
    );
  }
}
