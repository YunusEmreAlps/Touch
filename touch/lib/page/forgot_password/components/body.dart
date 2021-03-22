// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

// Components
import 'forgot_password_form.dart';
import 'package:touch/widget/or_divider.dart';

// Forgot Password Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Forgot Password
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: AppConstant.kPrimaryColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Explanation
                Text(
                  "Enter your email for the verification process.\nwe will send 4 digits code to your email.",
                  textAlign: TextAlign.center,
                ),

                // Forgot Password form
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
