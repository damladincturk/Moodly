import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:moodly/pages/istatistik.dart';
import 'package:moodly/pages/maindesign.dart';
import 'package:moodly/pages/profil.dart';

void main() => runApp(MyApp());

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
  final List<Widget> screens = [MainDesign(), Deneme(), Profil()];
  Widget currentScreen = MainDesign();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
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
          SpeedDialChild(child: Icon(Icons.draw), label: "Günlük Ekle"),
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
                          currentScreen = Deneme();
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
                  currentTab = 2;
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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.done_all_sharp),
            title: Text("Hedefler"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.align_vertical_bottom),
            title: Text("İstatistikler"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Tavsiyeler"),
            onTap: () => null,
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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Yardım"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
