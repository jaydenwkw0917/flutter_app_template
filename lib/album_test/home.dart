import 'package:best_flutter_ui_templates/camera_test/image_picker_edit.dart';
import 'package:camera/camera.dart';
import 'package:best_flutter_ui_templates/album_test/test.dart';
import 'package:flutter/material.dart';

class StartAlbumScreen extends StatelessWidget {

  /*void start(BuildContext context) async {
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
  }*/
  void pushToImagePicker(BuildContext context) async {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditorPro(appBarColor: Colors.black87,
          bottomBarColor: Colors.black87,
          pathSave: null, pixelRatio: 1.5,imagePath:''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('open Album'),
          onPressed: () {
            this.pushToImagePicker(context);
          },
        ),
      ),

    );
  }
}