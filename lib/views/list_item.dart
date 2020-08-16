  
import 'package:flutter/material.dart';
import 'package:otagu_app/widgets/main_wallpaper.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MainWallPaper(),
        ],
      ),
    );
  }
}