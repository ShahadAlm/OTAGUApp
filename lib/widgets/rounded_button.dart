import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(49),
        child: RaisedButton(
          //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          color: color,
          onPressed: press,
           elevation: 0.0,
          child: Text(
            text,
            style: TextStyle( fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}
