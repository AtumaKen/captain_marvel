import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/providers/appearance_provider.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/utility/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppearancesScreen extends StatefulWidget {
  @override
  _AppearancesScreenState createState() => _AppearancesScreenState();
}

class _AppearancesScreenState extends State<AppearancesScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    var dataProvider = Provider.of<AppearanceProvider>(context, listen: false);
    dataProvider.initStreams();
    if (dataProvider.appearances.isEmpty) dataProvider.fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (dataProvider.getLoadingStatus() == LoadingStatus.LOADING) return;
        dataProvider.setLoadingStatus(LoadingStatus.LOADING);
        dataProvider.fetchData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppearanceProvider>(
        builder: (ctx, appearanceProvider, child) {
          if (appearanceProvider.getLoadingStatus() == LoadingStatus.ERROR)
            return Center(
              child: Text("Something went wrong"),
            );
          List<Appearance> appearances = appearanceProvider.appearances;

          if (appearances.isNotEmpty) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemExtent: 100,
              itemBuilder: (ctx, index) {
                Appearance appearance = appearances[index];
                if (index == appearances.length - 1) {
                  if (appearanceProvider.getLoadingStatus() == LoadingStatus.END)
                    return Center(child: Text("The End"));
                  return Center(child: CupertinoActivityIndicator());
                }
                return ListTile(
                  leading: Image.network(appearance.imageUrl!),
                  title: Text(appearance.title!),
                  subtitle: Text(
                    Utilities.dateToString(
                      appearance.dates![0]["date"],
                    ),
                  ),
                );
              },
              itemCount: appearanceProvider.appearances.length,
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("This might take a while"),
              ],
            ),
          );
        });
  }
}
