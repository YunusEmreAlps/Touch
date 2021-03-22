// Touch
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/page/profile/profile_page.dart';
import 'package:touch/page/settings/settings.dart';
import 'package:touch/util/theme.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Pages
import 'package:touch/page/splash/splash_page.dart';
import 'package:touch/page/welcome/welcome_screen.dart';
import 'package:touch/page/sign_in/sign_in_screen.dart';
import 'package:touch/page/sign_up/sign_up_screen.dart';
import 'package:touch/page/forgot_password/forgot_password_screen.dart';
import 'package:touch/page/otp/otp_screen.dart';
import 'package:touch/page/login_success/login_success_screen.dart';
import 'package:touch/page/home/home_navigator.dart';
import 'package:touch/page/badge/badge_screen.dart';
import 'package:touch/widget/homepage/categories.dart';

void main() => runApp(Touch());

class Touch extends StatefulWidget {
  @override
  _TouchState createState() => _TouchState();
}

class _TouchState extends State<Touch> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: theme(),
      supportedLocales: [Locale("en"), Locale("tr")],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppConstant.pageSplash,
      routes: {
        AppConstant.pageSplash: (context) => SplashPage(),
        AppConstant.pageWelcome: (context) => WelcomeScreen(),
        AppConstant.pageSignIn: (context) => SignInScreen(),
        AppConstant.pageSignUp: (context) => SignUpScreen(),
        AppConstant.pageForgotPassword: (context) => ForgotPasswordScreen(),
        AppConstant.pageLoginSuccess: (context) => LoginSuccessScreen(),
        AppConstant.pageOTP: (context) => OtpScreen(),
        AppConstant.pageHome: (context) => HomeNavigator(),
        AppConstant.pageBadge: (context) => BadgeScreen(),
        AppConstant.pageProfile: (context) => ProfilePage(),
        AppConstant.pageSettings: (context) => SettingsPage(),
      },
    );
  }
}
