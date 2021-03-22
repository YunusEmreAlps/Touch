// Libraries
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

// Components
import 'otp_form.dart';

// OTP Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // OTP Verification
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "OTP Verification",
                style: TextStyle(
                    color: AppConstant.kPrimaryColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "We sent your code to "
                  ),

                ],
              ),
              buildTimer(),
              OtpForm(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 240.0, end: 0.0),
          duration: Duration(seconds: 240),
          builder: (_, value, child) => Text(
            "${value.toInt()} seconds",
            style: TextStyle(color: AppConstant.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
