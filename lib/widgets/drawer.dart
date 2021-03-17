import 'package:captain_marvel/models/drawer_model.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBack;

  const AppDrawer({Key? key, required this.screenIndex, required this.callBack})
      : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<DrawerModel> drawerItems = [];

  _setupDrawer() {
    drawerItems = [
      DrawerModel(
        title: "HOME",
        index: DrawerIndex.Home,
      ),
      DrawerModel(title: "COMICS", index: DrawerIndex.Comics),
      DrawerModel(title: "APPEARANCES", index: DrawerIndex.Appearances)
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupDrawer();
  }

  //Using list view builder in a case where more items will be added to the drawer .
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: Drawer(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return _drawerTile(drawerItems[index]);
              },
              itemCount: drawerItems.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerTile(DrawerModel drawerModel) {
    return ListTile(
      onTap: () {
        widget.callBack(drawerModel.index!);
        Navigator.of(context).pop();
      },
      title: Text(
        drawerModel.title!,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.screenIndex == drawerModel.index
                ? Colors.red
                : Colors.white70),
      ),
    );
  }
}
