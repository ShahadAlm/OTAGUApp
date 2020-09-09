import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/views/login_screen.dart';
import 'package:otagu_app/widgets/rounded_button.dart';

class DrawerHeaderContent extends StatefulWidget {
  @override
  _DrawerHeaderContentState createState() => _DrawerHeaderContentState();
}

class _DrawerHeaderContentState extends State<DrawerHeaderContent> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var Login = Provider.of<LoginBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Text(Login.getIsLogged_in.toString()),
        //  Login.getIsLogged_in?
        Center(
          child: Row(
            children: <Widget>[
              //the Sign in word must be the user name after he signed in
//              GestureDetector(
//                child:
//                new Text(
//                  "Sign Out",
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.deepOrange),
//                ),
//                onTap: () {
////                  Login.signOut();
////                  Navigator.pushNamed(context, '/');
//                },
//              ),
              //it appears when he is signed in
              Container(
                //width: 90,
                height: 35,
                color: Colors.transparent,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: ClipRRect(
                    child: Image.asset("assets/img/profileImg.jpg"),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          // width: size.width * 0.8,
          child: Text(
            'Welcome To OTAGU!',
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryLightColor, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          //the Sign in word must be the user name after he signed in
          child: ClipRRect(
            child: RoundedButton(
              color: kPrimaryLightColor,
              text: 'Login / Sign up',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ),
          ////////////  //it appears when he is signed in
          //   Container(
          //     //width: 90,
          //     height: 35,
          //     color: Colors.transparent,
          //     alignment: Alignment.topLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //         right: 8.0,
          //       ),
          //       child: ClipRRect(
          //         child: Image.asset("assets/images/profileImg.jpg"),
          //         borderRadius: BorderRadius.circular(40.0),
          //       ),
          //     ),
          //   ),
        )
      ],
    ));

    // Padding(
    //   padding: const EdgeInsets.only(top: 8.0),
    // ),
  }
}
