// Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

// Components
import 'package:touch/widget/form_error.dart';
import 'package:touch/widget/default_button.dart';

// Forgot Password form
class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>(); // control

  // Variables
  String email;
  var _controller = TextEditingController();

  // Error (Multiple Error)
  final List<String> formErrors = [];

  // Add Error
  void addError(String error) {
    if (!formErrors.contains(error)) {
      setState(() {
        formErrors.add(error);
      });
    }
  }

  // Remove Error
  void removeError(String error) {
    if (formErrors.contains(error)) {
      setState(() {
        formErrors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // E-mail
          buildEmailFormField(),

          // Forgot Password button
          // SizedBox(height: getProportionateScreenHeight(45)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: 'Continue',
            buttonColor: AppConstant.kPrimaryColor,
            textColor: Colors.white,
            press: () {
              if ((_formKey.currentState.validate()) &&
                  (formErrors.isEmpty == true)) {
                _formKey.currentState.save();
                // Forgot Password
                Navigator.pushNamed(context, AppConstant.pageOTP);
              }
            },
          ),

          // Form Error
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: formErrors),
        ],
      ),
    );
  }

  // E-mail TextField
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _controller,
      cursorColor: AppConstant.kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (Validator().validateEmail(value) != null) {
          if (formErrors
              .contains(AppLocalizations.getString(AppConstant.kEmailNullError))) {
            removeError(AppLocalizations.getString(AppConstant.kEmailNullError));
          } else if (formErrors
              .contains(AppLocalizations.getString(AppConstant.kInvalidEmailError))) {
            removeError(AppLocalizations.getString(AppConstant.kInvalidEmailError));
          }
        }
      },
      validator: (value) {
        if (Validator().validateEmail(value) != null) {
          addError(Validator().validateEmail(value));
          return ''; // Border must be red
        }
      },
      decoration: InputDecoration(
        labelText: AppLocalizations.getString(AppConstant.kEmailText),
        labelStyle: TextStyle(
          color: AppConstant.kSecondaryColor,
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(height: 0),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenWidth(9)),

        // Icon
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () => _controller.clear(),
                icon: Icon(Icons.clear),
              ),

        /*suffixIcon: IconButton(
          onPressed: () => _controller.clear(),
          icon: Icon(Icons.clear),
        ),*/

        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            "assets/icons/Mail.svg",
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
