import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/introduction_animation/introduction_animation_screen.dart';
import 'package:best_flutter_ui_templates/camera_test/home_screen_camera.dart';
import 'package:best_flutter_ui_templates/album_test/home.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/test1.png',
      navigateScreen: StartTakePictureScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/test2.png',
      navigateScreen: StartTakePictureScreen(),
    ),
    HomeList(
      imagePath: 'assets/fitness_app/test3.png',
      navigateScreen: StartTakePictureScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/test4.png',
      navigateScreen: StartTakePictureScreen(),
    ),
  ];
}
