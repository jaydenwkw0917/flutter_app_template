import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:metadata/metadata.dart' as metadata;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path/path.dart';
import 'package:image/image.dart' as ui;
import 'package:path_provider/path_provider.dart';

import 'image_picker_edit.dart';
import 'image_picker_edit.dart';
import 'modules/disable_screenshots.dart';


/*Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}*/

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AfterPictureTakenScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class AfterPictureTakenScreen extends StatelessWidget {
  final String imagePath;

  const AfterPictureTakenScreen({Key? key, required this.imagePath})
      : super(key: key);

  /*UploadTask uploadImage(File image, String email) {
    final extension = p.extension(image.path);
    final Reference ref = FirebaseStorage.instance.refFromURL('gs://snap-c95a3.appspot.com')
        .child('$email$extension');
    UploadTask uploadTask = ref.putFile(image);
    return uploadTask;
  }*/
  Future watermarks(BuildContext context) async{
    WaterMarks _plugin = WaterMarks();
    _plugin.addWatermark(context, "CW", rowCount: 4, columnCount: 8);
  }

  Future uploadImageToFirebase(String imagePath) async {
    await Firebase.initializeApp();
    //var uploadTask = uploadImage(File(imagePath), '12019240@life.hkbu.edu.hk');
    FirebaseStorage _storage = FirebaseStorage.instance;
    //var snapshot = await _storage.ref()
    //.child("test_image" + DateTime.now().toString())
    //.putFile(File(imagePath));
    DateTime now = new DateTime.now();
    Reference ref = _storage.ref().child('uploads/' + DateTime(now.year, now.month, now.day).toString()+'/'+now.toString());
    UploadTask uploadTask = ref.putFile(File(imagePath));
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
    //Auth
    /*FirebaseAuth mAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await mAuth.signInWithEmailAndPassword(
          email: "12019240@life.hkbu.edu.hk",
          password: "Kawai09!7"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }*/
  }
  void pushToDisplayImage (BuildContext context, String imagePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: imagePath),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var abc = Image.file(File(imagePath));
    var file = imagePath;
    var bytes = File(file).readAsBytesSync();
    var result = metadata.MetaData.exifData(bytes);
    if (result.error == null) {
      var content = result.exifData; // exif data is available in contents
      //saveFile(image_name, content);
    } else {
      print('File:jpg, Error: ${result.error}');
    }
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


}
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

    Future<File> mergeWaterMark (String imagePath) async {
      final originalImage = ui.decodeImage(File(imagePath).readAsBytesSync());
      final waterMarkImage  = ui.decodeImage((await rootBundle.load('assets/hotel/watermark3.png')).buffer.asUint8List());

    int width = max(originalImage!.width , waterMarkImage!.width);
    int height = max(originalImage!.height, waterMarkImage!.height);
    final mergedImage = ui.Image(width, height);
    ui.copyInto(mergedImage, originalImage, blend: false);
    ui.copyInto(mergedImage, waterMarkImage, blend :false);

    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = new File(join(documentDirectory.path, "merged_image.jpg"));
    file.writeAsBytesSync(ui.encodeJpg(mergedImage));

    return file;
  }


  @override
  Widget build(BuildContext context) {

    //File mergedImage = mergeWaterMark(imagePath) as File;
    return FutureBuilder<File>(
        future: mergeWaterMark(imagePath),
        builder: (context, AsyncSnapshot<File> mergedImage) {

          if (mergedImage.hasData) {
            return Scaffold(
              appBar: AppBar(title: const Text('Display the Picture')),
              body: Image.file(mergedImage.data ?? File(imagePath)),
              //body: Image.file(File(imagePath)),
            );
          } else {
            return CircularProgressIndicator();
          }
        }
    );
    /*return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(mergedImage),
      //body: Image.file(File(imagePath)),
    );*/
  }

}