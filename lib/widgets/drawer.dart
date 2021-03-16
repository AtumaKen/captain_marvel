import 'package:captain_marvel/models/drawer_model.dart';
import 'package:captain_marvel/screens/appearances_screen.dart';
import 'package:captain_marvel/screens/comics_screen.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<DrawerModel> drawerItems = [];



   _navigateToHome() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

   _navigateToComics() {
     Navigator.of(context).pushNamed(ComicsScreen.routeName);

   }

   _navigateToAppearances() {
    Navigator.of(context).pushNamed(AppearancesScreen.routeName);

  }

  _setUpList() {
    drawerItems = [
      DrawerModel(
        title: "HOME",
        callBack: () => _navigateToHome(),
        index: DrawerIndex.Home,
      ),
      DrawerModel(
          title: "COMICS",
          callBack: () => _navigateToComics(),
          index: DrawerIndex.Comics),
      DrawerModel(
          title: "APPEARANCES",
          callBack: () => _navigateToAppearances(),
          index: DrawerIndex.Appearances)
    ];
  }

  DrawerIndex _screenIndex = DrawerIndex.Home;

  _setScreenIndex(DrawerIndex index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setUpList();
  }

  //Using list view builder in a case where more items will be added to the drawer .
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black26
        ),
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
        _setScreenIndex(drawerModel.index!);
        drawerModel.callBack!();
      },
      title: Text(
        drawerModel.title!,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:
                _screenIndex == drawerModel.index ? Colors.red : Colors.white70),
      ),
    );
  }
}
