import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/screens/appearances_screen.dart';
import 'package:captain_marvel/screens/home_screen.dart';
import 'package:captain_marvel/screens/page_view_screen.dart';
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
    return ChangeNotifierProvider.value(
      value: ComicProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.black),
        home: MainScreen(),
      ),
    );
  }
}
