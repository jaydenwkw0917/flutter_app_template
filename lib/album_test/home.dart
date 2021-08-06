import 'package:camera/camera.dart';
import 'package:best_flutter_ui_templates/album_test/test.dart';
import 'package:flutter/material.dart';

class StartTestScreen extends StatelessWidget {
  /*void start(BuildContext context) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraApp(),
      ),
    );
  }*/
  void start(BuildContext context) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('test'),
          onPressed: () {
            this.start(context);
          },
        ),
      ),

    );
  }
}