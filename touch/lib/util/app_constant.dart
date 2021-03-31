import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  // Colors
  static final Color colorPrimary = Color(0xFFE11E3C);
  static final Color colorPageBg = Color(0xFFF8F8F8);
  static final Color colorHeading = Color(0xFF0A151F);
  static final Color colorParagraph = Color(0xFF4B5866);
  static final Color colorParagraph2 = Color(0xFF758291);
  static final Color colorVowelBg = Color(0xFFF0F0F0);
  static final Color colorUnifiedWordBg = Color(0xFFE8F0F1);
  static final Color colorUnifiedWordSearch = Color(0xFF73A5AA);
  static final Color colorUnifiedWordText = Color(0xFF2E494C);
  static final Color colorProverbsIdiomsBg = Color(0xFFF9F5F1);
  static final Color colorProverbsIdiomsSearch = Color(0xFFBB8E62);
  static final Color colorProverbsIdiomsText = Color(0xFF4F3822);
  static final Color colorVersionText = Color(0xFFF3A5B1);
  static final Color colorDrawerButton = Color(0xFFE8EAED);
  static final Color colorPullDown1 = Color(0xFFB41830);
  static final Color colorPullDown2 = Color(0xFFDEE3E3);
  static final Color colorBackButton = Color(0xFF48515B);
  static final Color colorAppDescription = Color(0xFF33414C);
  static final Color colorBottomSheetItemHeader = Color(0xFF183148);
  static final Color colorBottomSheetDivider = Color(0xFFEEF0F2);

  static final Color green = Color(0xff16d19a);
  static final Color grey = Color(0xffd2d1e1);
  static final Color colorRating = Color(0xfffec107);
  static final Color kTextColor = Color(0xFF757575); // Text
  static final Color kPrimaryColor = Color(0xFFFF7643); // Button
  static final Color kSecondaryColor = Color(0xFF979797); // Icon
  static final Color kPrimaryLightColor = Color(0xFFE4E9F2); // Background
  static final Color kSecondaryLightColor = Color(0xFFEFEFF4); // Background
  static final Color kSecondaryDarkColor = Color(0xFF404040);
  static final Color kAccentLightColor = Color(0xFFB3BFD7);
  static final Color kAccentDarkColor = Color(0xFF4E4E4E);
  static final Color kBackgroundDarkColor = Color(0xFF3A3A3A);
  static final Color kSurfaceDarkColor = Color(0xFF222225);

  static final Color kAccentIconLightColor = Color(0xFFECEFF5);
  static final Color kAccentIconDarkColor = Color(0xFF303030);
  static final Color kPrimaryIconLightColor = Color(0xFFECEFF5);
  static final Color kPrimaryIconDarkColor = Color(0xFF232323);

  static final Color kBodyTextColorLight = Color(0xFFA1B0CA);
  static final Color kBodyTextColorDark = Color(0xFF7C7C7C);
  static final Color kTitleTextLightColor = Color(0xFF101112);
  static final Color kTitleTextDarkColor = Colors.white;

  static final Color kShadowColor = Color(0xFF364564);

  static final kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );

  static final waves = LinearGradient(
    colors: [Color(0xFF0396FF), Color(0xFFABDCFF)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static final deepSpace = LinearGradient(
    colors: [Color(0xFF4CA1AF), Color(0xFF2C3E50)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final peachy = LinearGradient(
    colors: [Color(0xFFFFB382), Color(0xFFF07590)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final nebula = LinearGradient(
    colors: [Color(0xFFA1A3FF), Color(0xFF6D63EF)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final mildSea = LinearGradient(
    colors: [Color(0xFF96EFA6), Color(0xFF26A6B5)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final mildSeaRev = LinearGradient(
    colors: [Color(0xFF26A6B5), Color(0xFF96EFA6)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final purplin = LinearGradient(
    colors: [Color(0xFFA044FF), Color(0xFF6A3093)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final easyMed = LinearGradient(
    colors: [Color(0xFF45B649), Color(0xFFDCE35B)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final disco = LinearGradient(
    colors: [Color(0xFFB06AB3), Color(0xFF4568DC)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final aqua = LinearGradient(
    colors: [Color(0xFF5B86E5), Color(0xFF36D1DC)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final alive = LinearGradient(
    colors: [Color(0xFFBD3F32), Color(0xFFCB356B)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  // End

  static const double textScaleFactor = 1.0;
  static const double kDefaultPadding = 20.0;

  // Fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;
  // End

  // Strings
  static final String appName = 'Touch';
  static final String appVersion = "v.1.0";
  static final String appDescription = 'Touch Other Lives With Your Steps';
  static final String hakkinda = "About Us";
  static final String contact = "Contact Us";
  static final String wallet = "Wallet";
  static final String contactDetails = 'Contact Details';
  static final String epostayaz = 'Write E-Mail';
  static final String suggestions = 'Suggestions';
  static final String katkiOneriDetails = 'If you have any queries or issues for which you need your assistance: Feel free to mail us.';
  static final String address = '';
  static final String phoneNumber = '+90 553 698 89 10';
  static final String eposta = 'info@Touch.com.tr';
  static final String magaza = '';
  static final String eMagaza = 'Touch Info Webstite';
  static final String webappLink = 'Touch Web App';
  static final String magazaAddress = '';
  static final String appLongRichDescription = "Touch was founded on a dream of creating a global consumer technology company from Konya. We started our journey in 2021 with the vision of planting seeds for the future.\n\n";
  static final String appLongDescription ='Our goal at Touch is to gather people with high capabilities, strong values and a will to shape Touch’s story. \n\nTo start realising our big dreams, we choose social network as our first and main area of focus. \nSocial network is one of the few truly universal activities that transcends age, gender or nationality and we believe with the right product, we could reach billions of people worldwide.\n';

  // Welcome Screen Slider
  static final String welcomeSlide1Text = 'Welcome to Touch!';
  static final String welcomeSlide2Text = 'We help people to connect with \naround from nearby or around the world.';
  static final String welcomeSlide3Text = 'Take an Action For Other Peoples';

  // Pages Appbar
  static final String kSignInText = 'Sign In';
  static final String kSignUpText = 'Sign Up';
  static final String kResendText = 'Resend Code';

  // Button
  static final String kContinueText = 'Continue';
  static final String kDonateText = 'Donate Now : ';

  // TextFields
  static final String kEmailText = 'E-Mail Address';
  static final String kPasswordText = 'Password';
  static final String kFullNameText = 'Full Name';

  // Divider Text
  static final String kOrText = 'OR';

  // OnTap Questions
  static final String kForgetPasswordText = 'Forgot Your Password?';
  static final String kNoAccountText = 'Don\'t have an account? ';
  static final String kResendOTPText = 'Didn\'t received OTP? ';
  static final String khaveAccountText = 'Already have an account? ';

  // Errors
  static final String kEmailNullError = 'Please Enter your email';
  static final String kInvalidEmailError = 'Please Enter Valid Email';
  static final String kPassNullError = 'Please Enter your password';
  static final String kShortPassError = 'Password is too short';
  static final String kMatchPassError = 'Passwords don\'t match';
  static final String kNameNullError = 'Please Enter your name';
  static final String kInvalidNameError = 'Name must be a-z and A-Z';
  static final String kPhoneNumberNullError = 'Please Enter your phone number';
  static final String kAddressNullError = 'Please Enter your address';
  // Ends


  // Page
  static final String pageSplash = "/";
  static final String pageHome = "/home";
  static final String pageWelcome = "welcome";
  static final String pageSignIn = "signin";
  static final String pageSignUp = "signup";
  static final String pageLoginSuccess = "login_success_screen";
  static final String pageForgotPassword = "forgot_password_screen";
  static final String pageOTP = "otp_screen";
  static final String pageBadge = "badge_screen";
  static final String pageProfile = "profile_page";
  static final String pageSettings = "settings_page";
  // End

  // Assets
  // Splash Screen
  static final String splashSkyscraper1 = "assets/images/splash/skyscraper1.png"; 
  static final String splashSkyscraper2 = "assets/images/splash/skyscraper2.png"; 
  
  // Welcome Screen
  static final String welcomeSlide1 = "assets/images/welcome/slider_1.png";
  static final String welcomeSlide2 = "assets/images/welcome/slider_2.png";
  static final String welcomeSlide3 = "assets/images/welcome/slider_3.png";

  // Leaderboard Screen
  static final String pngCoin = "assets/images/leaderboard/dollar.png"; 
  static final String rankGolden = "assets/images/leaderboard/icon_rank_gd.png";
  static final String rankSilver = "assets/images/leaderboard/icon_rank_sr.png";
  static final String rankBronze = "assets/images/leaderboard/icon_rank_bn.png";

  static final String homeHeader = "assets/images/header/bg5.jpg";
  static final String pngLoginSuccess = "assets/images/login_success/success.png";

  static final String bg = "assets/images/bg5.jpg";
  static final String pngLogo = "assets/images/touch.png";
  static final String svgLogo = "assets/images/touch.svg";
  static final String svgMessage = "assets/images/tdk_icon_message.svg";
  // End
}

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);

buildTextTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity
            ? Colors.grey[400]
            : AppConstant.kPrimaryColor, // Colors.black
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
      ),
    ),
  );
}

// Circular Input Design
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: Color(0xFFF5F6F9)), // Social Card
  );
}

// OTP
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);