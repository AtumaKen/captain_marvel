import 'package:captain_marvel/models/comic.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/utility/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComicsScreen extends StatefulWidget {
  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  int _offset = 20;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    var dataProvider = Provider.of<ComicProvider>(context, listen: false);
    dataProvider.initStreams();
    if (dataProvider.comics.isEmpty) dataProvider.fetchData(_offset);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _offset += 20;
        dataProvider.fetchData(_offset);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ComicProvider>(
        builder: (ctx, comicProvider, child) {
          List<Comic> comics = comicProvider.comics;
          if (comics.isNotEmpty) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemExtent: 100,
              itemBuilder: (ctx, index) {
                Comic comic = comics[index];
                if (index  == comics.length -1 )
                  return Center(child: CupertinoActivityIndicator());
                //todo: add end of list notification
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  leading: Image.network(
                    comic.imageUrl!,
                    height: 100,
                  ),
                  title: Text(comic.title!),
                  subtitle: Text(
                      "Release Date: ${Utilities.dateToString(comic.dates![0]["date"])}"),
                  trailing: Text(
                      "IssueNumber: ${comicProvider.comics[index].issueNumber}"),
                );
              },
              itemCount: comicProvider.comics.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),),
          );
        },
      ),
    );
  }
}
