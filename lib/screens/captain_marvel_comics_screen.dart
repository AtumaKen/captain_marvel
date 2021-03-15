import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/utility/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaptainMarvelComic extends StatefulWidget {
  @override
  _CaptainMarvelComicState createState() => _CaptainMarvelComicState();
}

class _CaptainMarvelComicState extends State<CaptainMarvelComic> {
  int _offset = 20;
  ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    // TODO: implement initState
    var dataProvider = Provider.of<ComicProvider>(context, listen: false);
    dataProvider.initStreams();
    dataProvider.fetchData(_offset);
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
    return Consumer<ComicProvider>(
      builder: (ctx, comicProvider, child) {
        if (comicProvider.comics.isEmpty)
          return Center(child: CupertinoActivityIndicator());
        else
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemExtent: 100,
            itemBuilder: (ctx, index) {
              if (comicProvider.comics.isNotEmpty ){
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  leading: Image.network(
                    comicProvider.comics[index].imageUrl!,
                    height: 100,
                  ),
                  title: Text(comicProvider.comics[index].title!),
                  subtitle: Text(
                      "Release Date: ${Utilities.dateToString(comicProvider.comics[index].dates![0]["date"])}"),
                  trailing: Text(
                      "IssueNumber: ${comicProvider.comics[index].issueNumber}"),
                );
              }

              else if (index == comicProvider.comics.length) return Center(child: CupertinoActivityIndicator(),);
              return Center(child: CircularProgressIndicator());
            },
            itemCount: comicProvider.comics.length ,
          );
      },
    );
  }
}
