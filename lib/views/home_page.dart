  
import 'package:flutter/material.dart';
import 'package:otagu_app/models/item.dart';
import 'package:otagu_app/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  final Item item;

  const HomePage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(item: item),
    );
  }
}