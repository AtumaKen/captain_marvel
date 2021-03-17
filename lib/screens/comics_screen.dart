import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/utility/utilities.dart';
import 'package:captain_marvel/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComicsScreen extends StatefulWidget {
  static const routeName = "comicsScreen";
  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
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
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Stuff"),),
      body: SafeArea(
        child: Consumer<ComicProvider>(
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
                    if (index == comicProvider.comics.length) return Center(child: CupertinoActivityIndicator(),);
                    //todo: add end of list notification
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

                  return Center(child: CircularProgressIndicator());
                },
                itemCount: comicProvider.comics.length  + 1,
              );
          },
        ),
      ),
    );
  }
}