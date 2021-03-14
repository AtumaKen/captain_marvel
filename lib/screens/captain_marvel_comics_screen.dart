import 'package:captain_marvel/providers/comic_provider.dart';
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
    super.initState();
    var dataProvider = Provider.of<ComicProvider>(context, listen: false);
    dataProvider.initStreams();
    dataProvider.fetchData(_offset);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        dataProvider.fetchData(_offset + 20);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ComicProvider>(
      builder: (ctx, comicProvider, child) {
        if (comicProvider.comics.isEmpty)
          return Center(child: CupertinoActivityIndicator()); else
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemExtent: 100,
            itemBuilder: (ctx, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                leading: Image.network(
                  comicProvider.comics[index].imageUrl!,
                  height: 100,
                ),
                title: Text(comicProvider.comics[index].title!),
                subtitle: Text(
                    "IssueNumber: ${comicProvider.comics[index].issueNumber}"),
                trailing: Text("id: ${comicProvider.comics[index].id}"),
              );
            },
            itemCount: comicProvider.comics.length,
          );
      },
    );
  }
}
