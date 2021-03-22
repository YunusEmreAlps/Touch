// Libraries
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

class Validator {
  // Full Name Control
  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)'; // PHP preg_match()
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return AppLocalizations.getString(AppConstant.kNameNullError);
    } else if (!regExp.hasMatch(value)) {
      return AppLocalizations.getString(AppConstant.kInvalidNameError);
    }
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  // E-mail Control
  String validateEmail(String value) {
    String pattern =
        r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}'; // PHP preg_match()
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return AppLocalizations.getString(AppConstant.kEmailNullError);
    } else if (!regExp.hasMatch(value)) {
      return AppLocalizations.getString(AppConstant.kInvalidEmailError);
    }
    return null;
  }

  // Password Control
  String validatePasswordLength(String value) {
    if (value.length == 0) {
      return AppLocalizations.getString(AppConstant.kPassNullError);
    } else if (value.length < 10) {
      return AppLocalizations.getString(AppConstant.kShortPassError);
    }
    return null;
  }
}
