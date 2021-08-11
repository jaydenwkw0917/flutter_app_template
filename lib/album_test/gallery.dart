import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();

}

class _GalleryState extends State<Gallery>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  final picker = ImagePicker();
 /* void openGallery(Context context) async{
    var image = await picker.getImage(source: ImageSource.gallery);
    var decodedImage = await decodeImageFromList(File(image!.path).readAsBytesSync());
    setState(() {
      height = decodedImage.height;
      width = decodedImage.width;
      _image = File(image.path);
    });
    setState(() => _controller.clear());
    Navigator.pop(context);
  }*/
}