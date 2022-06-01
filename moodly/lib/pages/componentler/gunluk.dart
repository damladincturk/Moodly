import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  //final Stream<QuerySnapshot> generaldiaries =
  //  FirebaseFirestore.instance.collection('generaldiaries').snapshots();

  @override
  Widget build(BuildContext context) {
    CollectionReference reef =
        FirebaseFirestore.instance.collection('generaldiaries');
    var ref2 = reef.doc('Teknoloji');
    return Container(
      width: 370,
      height: 230,
      child: StreamBuilder<QuerySnapshot>(
        stream: reef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Hata var..");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loding..");
          }

          List<DocumentSnapshot> list = snapshot.data.docs;

          return Flexible(
              child: ListView.builder(

                  //scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  /*separatorBuilder: (context, index) => SizedBox(
                      width: 35,
                    ),*/

                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          '${list[index].data()?.['title']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('${list[index].data()['content']}'),
                      ),
                    );
                  }));
        },
      ),
    );
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

  _buildic() async {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference ref = _firestore.collection('generaldiaries');
    var response = await ref.get();
    var datalist = response.docs;
    print("list : ");
    print(datalist);
  }
}
