import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly/pages/componentler/controller.dart';
import 'package:moodly/pages/componentler/gunluk.dart';
import 'package:moodly/pages/gunlukler.dart';
import 'package:moodly/pages/maindesign.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

class GunlukEkle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GunlukEkle();
  }
}

class _GunlukEkle extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: form(),
    );
  }

  String _title = "";
  String _content = "";
  String _img = "";
  String _category = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingConroller =
      TextEditingController();
  final TextEditingController _imgEditingContoller = TextEditingController();

  form() {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 10, left: 10),
      width: 400,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTitle(),
              _buildContent(),
              SizedBox(
                height: 20,
              ),
              bi(),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.save();
                  register();
                },
                child: Text(
                  "Ekle",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildTitle() {
    return TextFormField(
      controller: _titleEditingController,
      decoration: InputDecoration(labelText: "Ba??l??k Giriniz "),
      validator: (value) {
        if (value!.isEmpty) {
          return 'L??tfen Ba??l??k Giriniz.';
        }
      },
      onSaved: (String? value) {
        _title = value!;
      },
    );
  }

  Widget _buildContent() {
    return TextFormField(
      controller: _contentEditingConroller,
      decoration: InputDecoration(labelText: "????erik Giriniz"),
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      validator: (value) {
        if (value!.isEmpty) {
          return 'L??tfen ????eri??i Giriniz.';
        }
      },
      onSaved: (String? value) {
        _title = value!;
      },
    );
  }

  profileController profilCntrl = Get.put(profileController());

  Row bi() {
    return Row(children: [
      ElevatedButton(
          child: Container(
            padding: EdgeInsets.only(left: 100),
            width: 359,
            child: Row(children: [
              Text("Resim Se??iniz : "),
              Icon(
                Icons.add_a_photo,
                size: 50,
              ),
            ]),
          ),
          onPressed: () {
            setState(() {
              _showPicker(context);
            });
          })
    ]);
  }

  _showPicker(context) {
    var img = "";
    profileController profilCntrl = Get.put(profileController());
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text("Foto??raf Galerisi"),
                      onTap: () {
                        profilCntrl.getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      })
                ],
              ),
            ),
          );
        });
  }

  final _firestore = FirebaseFirestore.instance;

  void register() async {
    CollectionReference diariesRef = _firestore.collection('users');

    var userDamla = _firestore
        .collection('users')
        .doc('bdb8FWIFtRWAadwZlq8s3yO7PSk2')
        .collection('diaries');

    Map<String, dynamic> fbsaveData = {
      'title': _titleEditingController.text,
      'content': _contentEditingConroller.text,
      'images': 'deneme',
      'category': 'Benim G??nl??klerim'
    };
    await userDamla.doc(_titleEditingController.text).set(fbsaveData);

    _titleEditingController.clear();
    _contentEditingConroller.clear();
    _imgEditingContoller.clear();
  }
}
