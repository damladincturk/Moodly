import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:moodly/pages/ayarlar.dart';
import 'package:moodly/pages/componentler/gunluk.dart';
import 'package:moodly/pages/gunlukekle.dart';
import 'package:moodly/pages/gunlukler.dart';
import 'package:moodly/pages/hedefler.dart';
import 'package:moodly/pages/istatistik.dart';
import 'package:moodly/pages/maindesign.dart';
import 'package:moodly/pages/profil.dart';
import 'package:moodly/pages/tavsiyeSayfasi.dart';
import 'package:moodly/pages/yardim.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  final _finalStore = FirebaseFirestore.instance;

  final List<Widget> screens = [
    MainDesign(),
    Profil(),
    GunlukSayfasi(),
    Hedefler(),
    Istatistik(),
    TavsiyeSayasi(),
    Ayarlar(),
    Yardim(),
    GunlukEkle()
  ];
  Widget currentScreen = MainDesign();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        _finalStore.collection('generaldiaries');
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Image.asset('lib/assets/images/logo.png'),
        title: Text("Moodly"),
        backgroundColor: Colors.amber,
      ),
      endDrawer: SideMenu(),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(
              child: Icon(Icons.draw),
              label: "Günlük Ekle",
              onTap: () {
                setState(() {
                  currentScreen = GunlukEkle();
                  currentTab = 8;
                });
              }),
          SpeedDialChild(
              child: Icon(Icons.done_all_sharp), label: "Hedef Ekle"),
          SpeedDialChild(child: Icon(Icons.emoji_emotions), label: "Mod Ekle")
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                      padding: EdgeInsets.only(right: 80),
                      minWidth: 40,
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = MainDesign();
                            currentTab = 0;
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.home,
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Anasayfa',
                              style: TextStyle(
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey),
                            ),
                          ),
                        ],
                      )),
                  MaterialButton(
                    padding: EdgeInsets.only(left: 80),
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = Istatistik();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.align_vertical_bottom,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'İstatikler',
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SideMenu() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Damla Dinçtürk"),
            accountEmail: Text("damladnt97@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_960_720.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2014/06/16/23/40/purple-370132_960_720.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(),
          SizedBox(),
          ListTile(
              leading: Icon(Icons.draw),
              title: Text("Profilim"),
              onTap: () {
                setState(() {
                  currentScreen = Profil();
                  currentTab = 1;
                  Navigator.pop(context);
                });
              }),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.draw),
            title: Text("Günlükler"),
            onTap: () {
              setState(() {
                currentScreen = GunlukSayfasi();
                currentTab = 2;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.done_all_sharp),
            title: Text("Hedefler"),
            onTap: () {
              setState(() {
                currentScreen = Hedefler();
                currentTab = 3;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.align_vertical_bottom),
            title: Text("İstatistikler"),
            onTap: () {
              setState(() {
                currentScreen = Istatistik();
                currentTab = 4;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Tavsiyeler"),
            onTap: () {
              setState(() {
                currentScreen = TavsiyeSayasi();
                currentTab = 5;
                Navigator.pop(context);
              });
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Ayarlar"),
            onTap: () {
              setState(() {
                currentScreen = Ayarlar();
                currentTab = 6;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Yardım"),
            onTap: () {
              setState(() {
                currentScreen = Yardim();
                currentTab = 7;
                Navigator.pop(context);
              });
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Çıkış"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
