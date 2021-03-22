import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/size_config.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 20,
          width: 4,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: AppConstant.kPrimaryColor),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        Spacer(),
        Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppConstant.pageHome);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppConstant.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
