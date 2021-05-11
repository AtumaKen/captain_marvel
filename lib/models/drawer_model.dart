
class DrawerModel{
  String? title;
  DrawerIndex? index;

  DrawerModel({this.title, this.index});
}

enum DrawerIndex{
  Home, Comics, Appearances, None
}