import 'file:///C:/Users/ASUS/AndroidStudioProjects/captain_marvel/lib/widgets/common/dark_container.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  final String imageName;

  const CommonWidget({Key? key, required this.imageName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      children: [
        Container(
          height: height * 0.34,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageName,
              ),
            ),
          ),
        ),
        DarkContainer(
          width: width,
          height: height * 0.33,
          slant: height * 0.305,
          text1: "CAROL DANVERS",
          text2: "CAPTAIN MARVEL",
          text3:
              "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
        )
      ],
    );
  }
}
