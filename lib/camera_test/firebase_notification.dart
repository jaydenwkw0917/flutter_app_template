import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as ui;



class AfterPictureTakenScreen extends StatelessWidget {
  final String imagePath;
  final String messageTitle = "Empty";
  final String notificationAlert = "alert";

  const AfterPictureTakenScreen({Key? key, required this.imagePath})
      : super(key: key);

  Future uploadImageToFirebase(String imagePath) async {
    await Firebase.initializeApp();

    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
  /*void pushToDisplayImage (BuildContext context, String imagePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: imagePath),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: new ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('uploadImageToFirebase'),
              onPressed: () {
                this.uploadImageToFirebase(imagePath);
              },
            ),
            RaisedButton(
              child: Text('DisplayImage'),
              onPressed: () {this.pushToDisplayImage(context, imagePath);
              },
            ),
            RaisedButton(
              child: Text('watermark'),
              onPressed: () {this.watermarks(context);
              },
            ),
          ]
      ),

    );
  }
*/

}