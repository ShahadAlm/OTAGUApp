import 'package:flutter/material.dart';
import 'clipp_header_class.dart';

class TopAppBar extends StatelessWidget {
  var _scaffoldKey;
  TopAppBar(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ClipPath(
      clipper:
      ClippHeaderclass(),
      child: Container(
        color: Colors.deepOrange,
        height: screenHeight / 3 * 0.5,
        child: Column(
          children: <Widget>[
            //Appbar content
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //the appbar content
                  //this builder for the profile icon that open the side Nav with red notification circle
                  Builder(
                    builder: (context) => IconButton(
                      icon: new Stack(children: <Widget>[
                        new Container(
                          //height: 30.0,
                          // width: 30.0,
                          child: Icon(
                            Icons.person,
                            color: Colors.deepOrangeAccent,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        new Positioned(
                          // draw a red marble
                          top: 0.0,
                          right: 0.0,
                          child: new Icon(Icons.brightness_1,
                              size: 10.0, color: Colors.red),
                        )
                      ]),
                      // Icon(Icons.person,color: Colors.white,),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                  // SearchIconBuilder(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //call the search icon widget class

//                                  IconButton(
//                                      alignment: Alignment.centerRight,
//                                      icon: Icon(
//                                        Icons.search,
//                                        color: Colors.white,
//                                      ),
//                                      onPressed: () {}),
//Icon Button
                      //AppBarCart(),
                      // IconButton(
                      //     // icon: Icon(
                      //     //   Icons.shopping_cart,
                      //     //   color: Colors.white,
                      //     // ),
                      //     icon: Text(Provider.of<CartBloc>(context)
                      //         .getNumberOfProduct
                      //         .toString()),
                      //     onPressed: () {
                      //       // Pushing a named route
                      //       Navigator.of(context).pushNamed(
                      //         '/CartPage',
                      //         //if we want to push data we push data in argument
                      //         //arguments: '',
                      //       );
                      //     }),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    "assets/img/HndLogo.png",
                    color: Colors.white,
                    fit: BoxFit.fitWidth,
                    //height: 250,
                    width: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}