import 'package:captain_marvel/models/drawer_model.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final List<DrawerModel>? drawerItems;
  final int page;
  final Function callBack;

  AppDrawer(
      {required this.drawerItems, required this.page, required this.callBack});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: Drawer(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return _drawerTile(widget.drawerItems![index], index);
              },
              itemCount: widget.drawerItems!.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerTile(DrawerModel drawerModel, int index) {
    return ListTile(
      onTap: () {},
      title: Text(
        drawerModel.title!,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.page  == index
                ? Colors.red
                : Colors.white70),
      ),
    );
  }
}
