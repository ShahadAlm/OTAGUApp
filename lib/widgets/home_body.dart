
import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'category.dart';
import 'package:otagu_app/models/data.dart';
import 'details_body.dart';
import 'drawer.dart';
import 'filter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomeState extends State<Home> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color(0xFF3E2723),
              Color(0xFFFBE9E7),
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Text(
                'OTAGU',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            drawer: MyDrawer(),
            body: ChangeNotifierProvider<AppState>(
                create: (_) => AppState(),
                child: Stack(children: <Widget>[
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height * 0.02),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Column(children: <Widget>[
                                FirstFilter(),
                              ])),

                          // Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          //     child: Consumer<AppState>(
                          //         builder: (context, appState, _) =>
                          //             Column(children: <Widget>[
                          //               // for (final event in events.where((e) => e
                          //               //     .categoryIds
                          //               //     .contains(appState.selectedCategoryId)))
                          //               //   EventWidget(
                          //               //     event: event,
                          //               //   ),
                          //             ]))),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20.0),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           color: Color(0xFFF4511E),
                          //           borderRadius: BorderRadius.circular(20.0),
                          //         ),
                          //         child: Center(
                          //           child: Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: 22.0, vertical: 6.0),
                          //             child: Text("NEW RELEASES",
                          //                 style:
                          //                     TextStyle(color: Colors.white)),
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 15.0,
                          //       ),
                          //       Text("25+ Movies",
                          //           style: TextStyle(color: Color(0xFFF4511E)))
                          //     ],
                          //   ),
                          // ),
                          Stack(
                            children: <Widget>[
                              //MainWallPaper(),
                              CardScrollWidget(currentPage),
                              Positioned.fill(
                                child: PageView.builder(
                                  itemCount: images.length,
                                  controller: controller,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Container();
                                  },
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Consumer<AppState>(
                              builder: (context, appState, _) =>
                                  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    for (final category in categories)
                                      CategoryWidget(category: category)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //  Padding(
                          //   padding: const EdgeInsets.only(left: 20.0),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           color: Color(0xFFF4511E),
                          //           borderRadius: BorderRadius.circular(20.0),
                          //         ),
                          //         child: Center(
                          //           child: Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: 22.0, vertical: 6.0),
                          //             child: Text("COMING SOON",
                          //                 style: TextStyle(color: Colors.white)),
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 15.0,
                          //       ),
                          //       Text("30+ Movies",
                          //           style: TextStyle(color: Color(0xFFF4511E)))
                          //     ],
                          //   ),
                          // ),
                          // Stack(
                          //   children: <Widget>[
                          //     //MainWallPaper(),
                          //     CardScrollWidget(currentPage),
                          //     Positioned.fill(
                          //       child: PageView.builder(
                          //         itemCount: images.length,
                          //         controller: controller,
                          //         reverse: true,
                          //         itemBuilder: (context, index) {
                          //           return Container();
                          //         },
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: FlatButton(
                                    child: Text("See More",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4511E))),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsBody(),
                                        ),
                                      );
                                    },

                                    // child: Text("See More",
                                    // style: TextStyle(
                                    //     fontSize: 14.0,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Color(0xFFF4511E))),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0;

  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Color(0xFFF4511E) : Color(0x99FFFFFF),
              width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Color(0xFFF4511E) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(category.name,
                style: TextStyle(
                  //fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
