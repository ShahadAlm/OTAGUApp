import 'package:flutter/material.dart';
import 'package:otagu_app/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'OTAGU',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      routes: routes,
    );
  }
}