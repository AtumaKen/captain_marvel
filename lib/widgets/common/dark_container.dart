import 'file:///C:/Users/ASUS/AndroidStudioProjects/captain_marvel/lib/widgets/common/clipped_container.dart';
import 'package:flutter/material.dart';

class DarkContainer extends StatelessWidget {
  final double width;
  final double height;
  final double slant;
  final String text1;
  final String text2;
  final String text3;

  const DarkContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.slant,
      required this.text1,
      required this.text2,
      required this.text3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Colors.black,
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.15,),
              Text(
                text1,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(
                text2,
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 12,),
              Text(
                text3,
                style: TextStyle(color: Colors.white, letterSpacing: 0.2, fontSize: 15),
                maxLines: 7,
              ),
            ],
          ),
        ),
      ),
      clipper: CustomClipPath(height, width, slant),
    );
  }
}
