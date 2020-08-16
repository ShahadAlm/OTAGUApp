import 'package:flutter/material.dart';
import 'package:otagu_app/models/item.dart';
import 'package:otagu_app/styles/constants.dart';
import 'package:otagu_app/views/home_page.dart';
import 'package:animations/animations.dart';

class ImageCard extends StatelessWidget {
  final Item item;

  const ImageCard({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: firstDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildItemCard(context),
        openBuilder: (context, action) => HomePage(item: item),
      ),
    );
  }

  Column buildItemCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(5.0),
              boxShadow: [kDefaultShadow],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(item.poster),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: firstDefaultPadding / 2),
          child: Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onPressed: null),
            SizedBox(width: firstDefaultPadding / 2),
            /*Text(
              "${item.rating}",
              style: Theme.of(context).textTheme.bodyText2,
            ),*/
          ],
        ),
      ],
    );
  }
}
