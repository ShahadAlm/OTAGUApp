import 'package:flutter/material.dart';

class MainWallPaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/img/WallPaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
