import 'package:captain_marvel/widgets/common/common_widget.dart';
import 'package:captain_marvel/widgets/common/follow.dart';
import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CommonWidget(imageName: "assets/images/cpt_marvel.jpg",),
      FollowWidget(),
    ],);
  }
}
