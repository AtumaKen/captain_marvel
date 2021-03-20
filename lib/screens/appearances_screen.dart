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
          _scrollController.position.maxScrollExtent ) {
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
      List<Appearance> appearances = appearanceProvider.appearances;
      if (appearances.isNotEmpty) {
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (ctx, index) {
            Appearance appearance = appearances[index];
            if (index == appearances.length - 1)
              return Center(
                child: CupertinoActivityIndicator(),
              );
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
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ));
    });
  }
}
