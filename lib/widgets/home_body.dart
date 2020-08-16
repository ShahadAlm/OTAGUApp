import 'package:flutter/material.dart';

//import 'dart:math' as math;

import 'package:otagu_app/models/item.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/widgets/top_app_bar.dart';

import 'category_filter.dart';
import 'drawer.dart';
import 'first_filter.dart';
import 'image_slider.dart';
import 'main_wallpaper.dart';

class Body extends StatefulWidget {
  final Item item;

  const Body({Key key, this.item}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    // it enable scroll on small device
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          MainWallPaper(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // 1-the Custom Appbar
                TopAppBar(_scaffoldKey),
                FirstFilter(),
                CategoryFilter(),
                SizedBox(height: firstDefaultPadding),
                ImageSlider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Text(
                          "see more",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("/list_items");
                        })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}