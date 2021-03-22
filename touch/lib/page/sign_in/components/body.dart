// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

// Components
import 'sign_in_form.dart';
import 'package:touch/widget/or_divider.dart';
import 'package:touch/widget/social_card.dart';

// Sign Up Body
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
                // Welcome Text
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 0.02
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: AppConstant.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),

                // Sign in form
                SizedBox(height: SizeConfig.screenHeight * 0.08), // 0.06
                SignForm(),

                // Social Buttons
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 0.02
                OrDivider(
                  text: AppLocalizations.getString(AppConstant.kOrText),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
