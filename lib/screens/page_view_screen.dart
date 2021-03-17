import 'package:captain_marvel/models/drawer_model.dart';
import 'package:captain_marvel/screens/appearances_screen.dart';
import 'package:captain_marvel/screens/comics_screen.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:captain_marvel/widgets/drawer.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  late final PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<DrawerModel> drawerItems = [
    DrawerModel(
      title: "HOME",
      callBack: () {},
      index: DrawerIndex.Home,
    ),
    DrawerModel(
        title: "COMICS",
        callBack: () {},
        index: DrawerIndex.Comics),
    DrawerModel(
        title: "APPEARANCES",
        callBack: () {},
        index: DrawerIndex.Appearances)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(drawerItems: drawerItems, page: _page, callBack: ()=> _onPageChanged(_page),),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged:  _onPageChanged,
        children: [
          HomeScreen(), ComicsScreen(), AppearancesScreen()
        ],
      ),
    );
  }

  void _onPageChanged(int page){
    setState(() {
      _page = page;
    });
    _pageController.jumpToPage(page);
  }
}
