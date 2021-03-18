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
  DrawerIndex drawerIndex = DrawerIndex.None;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenView,
      appBar: AppBar(title: Text("AppBar"),),
      drawer: AppDrawer(
        screenIndex: drawerIndex == DrawerIndex.None ? DrawerIndex.Home : drawerIndex,
        callBack: (DrawerIndex index){
          try{
            _changeIndex(index);
          }
          catch (e){

          }
        }
      ),
    );
  }

  void _changeIndex(DrawerIndex  index){
    if (drawerIndex != index) {
      drawerIndex = index;
      if(drawerIndex == DrawerIndex.Home){
        setState(() {
          _screenView = HomeScreen();
        });
      }
      else if (drawerIndex == DrawerIndex.Comics){
        setState(() {
          _screenView = ComicsScreen();
        });
      }
      else if(drawerIndex == DrawerIndex.Appearances){
        setState(() {
          _screenView = AppearancesScreen();
        });
      }
    }
  }
}
