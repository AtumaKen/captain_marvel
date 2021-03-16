import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/screens/appearances_screen.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/comics_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.black),
      home: ChangeNotifierProvider.value(
          value: ComicProvider(), child: HomeScreen()),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ComicsScreen.routeName: (ctx) => ComicsScreen(),
        AppearancesScreen.routeName: (ctx) => AppearancesScreen()
      },
    );
  }
}
