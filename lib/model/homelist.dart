import 'package:best_flutter_ui_templates/camera_test/home_screen_camera.dart';
import 'package:best_flutter_ui_templates/album_test/home.dart';
import 'package:flutter/widgets.dart';

import '../home_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/test1.png',
      navigateScreen: StartTakePictureScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/test2.png',
      navigateScreen: StartAlbumScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/test3.png',
      navigateScreen: MyHomePage(),
    ),
    HomeList(
      imagePath: 'assets/images/test4.png',
      navigateScreen: MyHomePage(),
    ),
  ];
}
