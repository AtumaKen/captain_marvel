import 'package:flutter/material.dart';

class FollowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FOLLOW",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/new_grey_fb.png",
                    height: 20,
                    width: 40,color: Colors.grey,
                  ),
                  SizedBox(width: 25,),
                  Image.asset(
                    "assets/images/twitter_icon.png",
                    height: 20,
                    width: 30,
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(thickness: 0.5,)
      ],
    );
  }
}
