import 'package:flutter/material.dart';
import 'package:otagu_app/styles/constants.dart';

class FirstFilter extends StatefulWidget {
  @override
  _FirstFilterState createState() => _FirstFilterState();
}

class _FirstFilterState extends State<FirstFilter> {
  int selectedFilter = 0;
  List<String> FirstFilter = ["New Releases", "Just Added", "Coming Soon"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: firstDefaultPadding / 2),
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
      padding: const EdgeInsets.symmetric(horizontal: firstDefaultPadding),
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
                    fontSize: 15,
                    color: index == selectedFilter
                        ? kTextColor
                        : Colors.white.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: firstDefaultPadding / 2),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedFilter ? orange : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}