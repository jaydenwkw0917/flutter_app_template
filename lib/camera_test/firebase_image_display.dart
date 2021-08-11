
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DisplayFireBaseimage extends StatelessWidget {
  final Image image;
  const DisplayFireBaseimage({Key? key,  required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Display image from firebase')),
      body: image,
      //body: Image.file(File('/data/user/0/com.example.best_flutter_ui_templates/app_flutter/merged_image.jpg')),
    );
  }

}