import 'package:captain_marvel/models/comic.dart';
import 'package:flutter/material.dart';

class CaptainMarvelComicWidget extends StatelessWidget {
   final Comic comic;

  const CaptainMarvelComicWidget({required this.comic}) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
        ),
      ),
    );
  }
}
