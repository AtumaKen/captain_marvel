import 'package:captain_marvel/providers/appearance_provider.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/screens/page_view_screen.dart';
import 'package:flutter/material.dart';

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
      home: MainScreen(),
    );
  }
}
