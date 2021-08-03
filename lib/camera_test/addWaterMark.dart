import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:image/image.dart' as ui;

class WaterMark {

  Future addWaterMark(String imagePath) async {
    File _originalImage = File(imagePath);
    File _watermarkImage = File(imagePath);
    Image abc = Image.file(File(imagePath));
    File _watermarkedImage;
    var file = imagePath;
    var bytes = File(file).readAsBytesSync();
    ui.Image? originalImage = ui.decodeImage(_originalImage.readAsBytesSync());
    ui.Image? watermarkImage = ui.decodeImage(_watermarkImage.readAsBytesSync());
    ui.Image image = ui.Image(160, 50);
    /*ui.drawImage(image, abc);

    final picker = ImagePicker();

    Future getOriginalImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _originalImage = File(pickedFile.path);
      });
    }

    Future getWatermarkImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _watermarkImage = File(pickedFile.path);
      });
    }

     */

  }


}
