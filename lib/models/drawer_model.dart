import 'dart:ui';

class DrawerModel{
  String? title;
  VoidCallback? callBack;
  DrawerIndex? index;

  DrawerModel({this.title, this.callBack, this.index});
}

enum DrawerIndex{
  Home, Comics, Appearances
}