// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class profileController extends GetxController {
  File? _photo;

  getImage(ImageSource imageSource) async {
    ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _photo = File(image.path);
      uploadFile();
    }
  }

  uploadFile() async {
    if (_photo == null) return "null";
    final fileName = _photo?.path;
    final destination = 'assets/images/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('assets/images/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }
}
