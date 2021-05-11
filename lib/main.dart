import 'package:captain_marvel/providers/appearance_provider.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/screens/page_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        //create manages the entire life cycle of the provider
        /// If you already have an instance of [ChangeNotifier] and want to expose it,
        /// you should use [ChangeNotifierProvider.value] instead of the default
        /// Failing to do so may dispose the [ChangeNotifier] when it is still in use.
        ChangeNotifierProvider<ComicProvider>(
          create: (_) => ComicProvider(),
        ),
        ChangeNotifierProvider.value(value: AppearanceProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
