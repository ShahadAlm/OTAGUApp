import 'package:flutter/material.dart';
import 'package:otagu_app/models/item.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/widgets/category_filter.dart';
import 'package:otagu_app/widgets/first_filter.dart';
import 'package:otagu_app/widgets/image_slider.dart';

class ReleasesPage extends StatefulWidget {
  final Item item;

  const ReleasesPage({Key key, this.item}) : super(key: key);
  @override
  _ReleasesPageState createState() => _ReleasesPageState();
}

class _ReleasesPageState extends State<ReleasesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
       FirstFilter(),
       CategoryFilter(),
       SizedBox(height: firstDefaultPadding),
       ImageSlider(),
     ],

    );
  }
}