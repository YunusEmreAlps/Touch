// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  // Don't forget Renderflex Error
  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
        Spacer(),
        Text(
          AppConstant.appName,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: AppConstant.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265), // 1/4
          width: getProportionateScreenWidth(235),   // 1/4 
        ),
      ],
    );

  }
}
