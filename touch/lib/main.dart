// Touch
import 'package:touch/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:touch/util/app_constant.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:touch/util/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pedometer/pedometer.dart';
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
import 'package:touch/page/settings/settings.dart';
import 'package:touch/page/profile/profile_page.dart';
import 'store/sharedpreferences/sharedpreferences.dart';

void main() => runApp(Touch());

class Touch extends StatefulWidget {
  @override
  _TouchState createState() => _TouchState();
}

class _TouchState extends State<Touch> {
  final ThemeModel _model = ThemeModel();

  @override
  Widget build(BuildContext context) {
    check();

    AppLocalizations.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>.value(value: _model),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, model, child) => MaterialApp(
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
        ),
      ),
    );
  }

  Future<void> check() async {
    int day = await Pref().loadInt("day");
    int month = await Pref().loadInt("month");
    int year = await Pref().loadInt("year");
    int step = await Pref().loadInt("step");

    print("date: " + day.toString() + month.toString() + year.toString());
    print(await Pref().loadInt("paid"));

    if (year < DateTime.now().year ||
        month < DateTime.now().month ||
        day < DateTime.now().day) {
      Pref().saveInt("paid", 0);
      Pref().saveInt("day", DateTime.now().day);
      Pref().saveInt("month", DateTime.now().month);
      Pref().saveInt("year", DateTime.now().year);
      Pref().saveInt("oldstep", step);
      Pref().saveInt("dailystep", 0);
    } else {
      Pref().saveInt("day", DateTime.now().day);
      Pref().saveInt("month", DateTime.now().month);
      Pref().saveInt("year", DateTime.now().year);
    }

    print("date: " + day.toString() + month.toString() + year.toString());
  }
}
