import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/providers/appearance_provider.dart';
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
  int _offset = 100;

  @override
  void initState() {
    var dataProvider = Provider.of<AppearanceProvider>(context, listen: false);
    dataProvider.initStreams();
    dataProvider.fetchData(0);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent ||
          dataProvider.appearances.length < 20) {
        _offset += 100;
        dataProvider.fetchData(_offset);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppearanceProvider>(
        builder: (ctx, appearanceProvider, child) {
      if (appearanceProvider.appearances.isEmpty)
        return Center(child: CupertinoActivityIndicator());
      return ListView.builder(
        itemBuilder: (ctx, index) {
          Appearance appearance = appearanceProvider.appearances[index];
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
    });
  }
}
