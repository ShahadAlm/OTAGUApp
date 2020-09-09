import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/widgets/already_have_an_account_acheck.dart';
import 'package:otagu_app/views/login_screen.dart';
import 'package:otagu_app/views/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  String msgStatus = '';

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  register(String username, email, gender, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': username,
      'email': email,
      'gender': gender,
      'password': pass
    };
    var jsonResponse;

    var response = await http.post(
        "https://fathomless-shore-29339.herokuapp.com/api/auth/register/",
        body: data);
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: _usernameController.text == "" ||
                _emailController.text == "" ||
                _genderController.text == "" ||
                _passwordController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                register(_usernameController.text, _emailController.text,
                    _genderController.text, _passwordController.text);
              },
        elevation: 0.0,
        color: kPrimaryColor,
        child: Text(
          "SIGNUP",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[300],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
      ),
    );
  }

  void _onClick(String gender) {
    setState(() {
      _genderController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                child: Image.asset("assets/img/HndLogo.png",
                    height: size.height * 0.35),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: new TextField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Username',
                  icon: new Icon(Icons.person, color: kPrimaryColor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: new TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: new Icon(Icons.email, color: kPrimaryColor),
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //   width: size.width * 0.8,
            //   decoration: BoxDecoration(
            //     color: kPrimaryLightColor,
            //     borderRadius: BorderRadius.circular(29),
            //   ),
            //   child: new TextField(
            //     controller: _genderController,
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       hintText: 'Gender',
            //       icon: new Icon(Icons.people, color: kPrimaryColor),
            //     ),
            //   ),
            // ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender: ',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Ink(
                            decoration: const ShapeDecoration(
                              color: kPrimaryColor,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(MdiIcons.genderMale),
                              color: Colors.white,
                              onPressed: () => _onClick('M'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Ink(
                            decoration: const ShapeDecoration(
                              color: kPrimaryColor,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(MdiIcons.genderFemale),
                              color: Colors.white,
                              onPressed: () => _onClick('F'),
                            ),
                          ),
                        ]),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: new TextField(
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: new Icon(Icons.lock, color: kPrimaryColor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              child: buttonSection(),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
