// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';


// Components
import 'sign_up_form.dart';

// Sign Up Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Responsive
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Register Account
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: AppConstant.kPrimaryColor,
                  ),
                ),
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),

                // Sign Up Form
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}