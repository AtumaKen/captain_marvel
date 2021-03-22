import 'package:captain_marvel/models/drawer_model.dart';
import 'package:captain_marvel/screens/appearances_screen.dart';
import 'package:captain_marvel/screens/comics_screen.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:captain_marvel/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _screenView = HomeScreen();
  bool sortedAppearances = false;
  bool sortedComics = false;
  PreferredSizeWidget appBar = AppBar(
    title: Image.asset(
      "assets/images/marvel-logo-header.jpg",
      height: 60,
    ),
    centerTitle: true,
  );
  DrawerIndex drawerIndex = DrawerIndex.None;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screenView,
        appBar: appBar,
        drawer: AppDrawer(
            screenIndex: drawerIndex == DrawerIndex.None
                ? DrawerIndex.Home
                : drawerIndex,
            callBack: (DrawerIndex index) {
              try {
                _changeIndex(index);
              } catch (e) {}
            }),
      ),
    );
  }

  void _changeIndex(DrawerIndex index) {
    if (drawerIndex != index) {
      drawerIndex = index;
      if (drawerIndex == DrawerIndex.Home) {
        setState(() {
          _screenView = HomeScreen();
          appBar = AppBar(
            title: Image.asset(
              "assets/images/marvel-logo-header.jpg",
              height: 60,
            ),
            centerTitle: true,
          );
        });
      } else if (drawerIndex == DrawerIndex.Comics) {
        setState(() {
          appBar = AppBar(
            title: Text("Comics"),
            centerTitle: true,
            actions: [
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text("Sort By Date"),
                    value: 0,
                  ),
                ],
                onSelected: (index) {
                  if (index == 0) {
                    setState(() {
                      sortedComics = !sortedComics;
                    });
                  }
                },
              )
            ],
          );
          _screenView = ComicsScreen();
        });
      } else if (drawerIndex == DrawerIndex.Appearances) {
        setState(() {
          _screenView = AppearancesScreen();
          appBar = AppBar(
            title: Text("Appearances"),
            centerTitle: true,
            actions: [
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text("Sort By Date"),
                  ),
                ],
                onSelected: (index) {
                  setState(() {
                    sortedAppearances = !sortedAppearances;
                  });
                },
              )
            ],
          );
        });
      }
    }
  }
}
