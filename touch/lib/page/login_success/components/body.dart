// Libraries
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';

// Components
import 'package:touch/widget/default_button.dart';

// Login Success Body
class Body extends StatefulWidget {
  @override
  _LoginSuccessScreenState createState() => new _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<Body> {
  // Page Routing
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => goToHome(context));
  }

  static void goToHome(BuildContext context) {
    Navigator.popAndPushNamed(context, AppConstant.pageHome);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        // Success Image
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.5,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Login Success",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
