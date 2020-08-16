import 'package:flutter/material.dart';
import 'package:otagu_app/views/login_screen.dart';


class DrawerHeaderContent extends StatefulWidget {
  @override
  _DrawerHeaderContentState createState() =>
      _DrawerHeaderContentState();
}

class _DrawerHeaderContentState extends State<DrawerHeaderContent> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var Login = Provider.of<LoginBloc>(context);

    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Text(Login.getIsLogged_in.toString()),
          //  Login.getIsLogged_in?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //the Sign in word must be the user name after he signed in
              GestureDetector(
                child: new Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                onTap: () {
                 Navigator.push(
                   context,
                    MaterialPageRoute(
                      builder:
                          (context) => LoginScreen(),
                    ),
                  );
                },
              ),
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

          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          // ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        onPressed: () {
                      //    Navigator.of(context).pushNamed(
                            //'/WishListPsge',
                            //if we want to push data we push data in argument
                            //arguments: '',
                        //  );
                        },
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0), //or 15
                          //color: Colors.deepOrange.withOpacity(0.3),
                          border: Border.all(color: Colors.white))),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Wish List",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      child: IconButton(
                        icon: Icon(Icons.widgets),
                        onPressed: () {},
                        color: Colors.white,
                        //alignment: Alignment.topRight,
                        // padding: EdgeInsets.all(2.0),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0), //or 15
                          //color: Colors.deepOrange.withOpacity(0.3),
                          border: Border.all(color: Colors.white))),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Coupons",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      child: IconButton(
                        icon: Icon(Icons.history),
                        onPressed: () {},
                        color: Colors.white,
                        //alignment: Alignment.topRight,
                        // padding: EdgeInsets.all(2.0),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0), //or 15
                          //color: Colors.deepOrange.withOpacity(0.3),
                          border: Border.all(color: Colors.white))),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Activity",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      child: IconButton(
                        icon: Icon(Icons.reorder),
                        onPressed: () {},
                        color: Colors.white,
                        //alignment: Alignment.topRight,
                        // padding: EdgeInsets.all(2.0),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0), //or 15
                          //color: Colors.deepOrange.withOpacity(0.3),
                          border: Border.all(color: Colors.white))),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Orders",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}