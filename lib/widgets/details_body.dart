import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/views/home_page.dart';
import 'package:otagu_app/widgets/rounded_button.dart';

class DetailsBody extends StatefulWidget {
  DetailsBody() : super();

  final String title = "Collpasable Appbar Demo";

  @override
  DetailsBodyState createState() => DetailsBodyState();
}

class DetailsBodyState extends State<DetailsBody> {
  IconData myFeedback1 = Icons.star,
      myFeedback2 = Icons.star,
      myFeedback3 = Icons.star,
      myFeedback4 = Icons.star,
      myFeedback5 = Icons.star;
  Color myFeedbackColor1 = Colors.grey,
      myFeedbackColor2 = Colors.grey,
      myFeedbackColor3 = Colors.grey,
      myFeedbackColor4 = Colors.grey,
      myFeedbackColor5 = Colors.grey;
  var sliderValue = 0.0;
  //var rating = 3.0;
  double _rating;

  List<Widget> StarWidget() {
    List<Widget> myContainer = new List();
    myContainer.add(Container(
        child: Icon(
      myFeedback1,
      color: myFeedbackColor1,
      size: 50.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback2,
      color: myFeedbackColor2,
      size: 50.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback3,
      color: myFeedbackColor3,
      size: 50.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback4,
      color: myFeedbackColor4,
      size: 50.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback5,
      color: myFeedbackColor5,
      size: 50.0,
    )));
    return myContainer;
  }

  void _moreInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('More Information'),
          content: Text('title: Joker '),
          actions: <Widget>[
            new RaisedButton(
              child: Text(
                'Close',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Joker",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Image.asset(
                      "assets/img/joker.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ];
            },
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  // _heading('Rating Bar'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Rating: $_rating",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: FlatButton(
                        onPressed: () => _moreInfo(context),
                        child: Text(
                          "> More Information",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        )),
                  ),
                  ClipRRect(
                    child: RoundedButton(
                      color: kPrimaryColor,
                      text: 'Add To Favorite',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    child: Align(
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Container(
                            width: 350.0,
                            height: 300.0,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: StarWidget(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Slider(
                                      min: 0.0,
                                      max: 5.0,
                                      divisions: 5,
                                      value: sliderValue,
                                      activeColor: kPrimaryColor,
                                      inactiveColor: Colors.blueGrey,
                                      onChanged: (newValue) {
                                        setState(() {
                                          sliderValue = newValue;
                                          if (sliderValue == 1.0) {
                                            myFeedback1 = Icons.star;
                                            myFeedbackColor1 = Colors.amber;
                                          } else if (sliderValue < 1.0) {
                                            myFeedback1 = Icons.star;
                                            myFeedbackColor1 = Colors.grey;
                                          }
                                          if (sliderValue == 2.0) {
                                            myFeedback2 = Icons.star;
                                            myFeedbackColor2 = Colors.amber;
                                          } else if (sliderValue < 2.0) {
                                            myFeedback2 = Icons.star;
                                            myFeedbackColor2 = Colors.grey;
                                          }
                                          if (sliderValue == 3.0) {
                                            myFeedback3 = Icons.star;
                                            myFeedbackColor3 = Colors.amber;
                                          } else if (sliderValue < 3.0) {
                                            myFeedback3 = Icons.star;
                                            myFeedbackColor3 = Colors.grey;
                                          }
                                          if (sliderValue == 4.0) {
                                            myFeedback4 = Icons.star;
                                            myFeedbackColor4 = Colors.amber;
                                          } else if (sliderValue < 4.0) {
                                            myFeedback4 = Icons.star;
                                            myFeedbackColor4 = Colors.grey;
                                          }
                                          if (sliderValue == 5.0) {
                                            myFeedback5 = Icons.star;
                                            myFeedbackColor5 = Colors.amber;
                                          } else if (sliderValue < 5.0) {
                                            myFeedback5 = Icons.star;
                                            myFeedbackColor5 = Colors.grey;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      child: Text(
                                    "Your Rating : $sliderValue",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      color: kPrimaryColor,
                                      child: Text(
                                        'Submit',
                                        style:
                                            TextStyle(color: Color(0xffffffff)),
                                      ),
                                      onPressed: () {},
                                    ),
                                  )),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ]))));
  }
}
