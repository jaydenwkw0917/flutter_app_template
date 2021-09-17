
import 'package:flutter/widgets.dart';

import 'home_screen.dart';


class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/test1.png',
      navigateScreen: MyHomePage(),
      //navigateScreen: StartTakePictureScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/test2.png',
      navigateScreen: MyHomePage(),
      //navigateScreen: StartAlbumScreen(),
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
