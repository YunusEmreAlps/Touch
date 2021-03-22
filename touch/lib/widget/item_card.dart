import 'package:flutter/material.dart';
import 'package:touch/model/Badge.dart';

import 'package:touch/util/app_constant.dart';

class ItemCard extends StatelessWidget {
  final Badge badge;
  final Function press;
  const ItemCard({
    Key key,
    this.badge,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AppConstant.kDefaultPadding),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: badge.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${badge.id}",
                child: Image.asset(badge.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConstant.kDefaultPadding / 4),
            child: Text(
              // products is out demo list
              badge.title,
              style: TextStyle(color: AppConstant.kSurfaceDarkColor),
            ),
          ),
          Text(
            "${badge.level}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
