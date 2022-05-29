import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gunluk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
                width: 35,
              ),
          itemBuilder: ((context, index) => buildCard(item: items[index]))),
    );
  }

  Widget buildCard({required CartItem item}) => Container(
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
