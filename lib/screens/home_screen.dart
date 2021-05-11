import 'package:captain_marvel/screens/profile.dart';
import 'package:captain_marvel/screens/report.dart';
import 'package:flutter/material.dart';

import 'overview.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _pages = [];
  int _selectedIndex = 0;
  bool _isSelected = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        "page": OverviewWidget(),
      },
      {
        "page": ProfileWidget(),
      },
      {
        "page": ReportWidget(),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSelected ? _pages[1]["page"] : _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 7,
                    color: _selectedIndex == 0 ? Colors.red : Colors.black,
                  ),
                  SizedBox(height: 30,)
                ],
              ),
              label: "OVERVIEW"),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 7,
                  color: _selectedIndex == 1 ? Colors.red : Colors.black,
                ),
                SizedBox(height: 30,)
              ],
            ),
            label: "IN COMICS PROFILE",
          ),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 7,
                    color: _selectedIndex == 2 ? Colors.red : Colors.black,
                  ),
                  SizedBox(height: 25,)
                ],
              ),
              label: "IN COMICS FULL\n\t     REPORT"),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _isSelected ? _selectedIndex = 1 : _selectedIndex,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
