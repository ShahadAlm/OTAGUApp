import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';

class FirstFilter extends StatefulWidget {
  @override
  _FirstFilterState createState() => _FirstFilterState();
}

class _FirstFilterState extends State<FirstFilter> {
  int selectedFilter = 0;
  List<String> FirstFilter = ["TV", "ANIMATION", "GAMES"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0 / 2),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FirstFilter.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              FirstFilter[index],
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: index == selectedFilter
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0 / 2),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedFilter
                    ? kPrimaryColor
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
