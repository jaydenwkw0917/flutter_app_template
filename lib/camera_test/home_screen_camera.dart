import 'package:camera/camera.dart';
import 'package:best_flutter_ui_templates/camera_test/cameras.dart';
import 'package:best_flutter_ui_templates/camera_test/voice_record.dart';
import 'package:best_flutter_ui_templates/camera_test/video.dart';
import 'package:best_flutter_ui_templates/camera_test/input_form.dart';
import 'package:best_flutter_ui_templates/camera_test/image_picker_edit.dart';
//import 'package:best_flutter_ui_templates/camera_test/video_record.dart';
import 'package:flutter/material.dart';

class StartTakePictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('快照任務'),
        ),
        body: BottonList()
    );
  }
}


class BottonList extends StatelessWidget {
  void pushToCamera(BuildContext context) async {
    final cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: cameras.first),
      ),
    );
  }

  void pushToVoice(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VoiceRecord(),
      ),
    );
  }

  void pushToCameraApp(BuildContext context) async {
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
  }

  void pushToForm(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputForm(),
      ),
    );
  }
  void pushToImagePicker(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditorPro(appBarColor: Colors.black87,
          bottomBarColor: Colors.black87,
          pathSave: null, pixelRatio: 1.5,),
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
              child: Text('Form'),
              onPressed: () {
                this.pushToForm(context);
              },
            ),
            RaisedButton(
              child: Text('Photo'),
              onPressed: () {
                this.pushToCamera(context);
              },
            ),
            RaisedButton(
              child: Text('Voice'),
              onPressed: () {
                this.pushToVoice(context);
              },
            ),
            RaisedButton(
              child: Text('CameraApp'),
              onPressed: () {
                this.pushToCameraApp(context);
              },
            ),
            RaisedButton(
              child: Text('ImagePicker'),
              onPressed: () {
                this.pushToImagePicker(context);
              },
            ),
          ]
      ),

    );
  }

}