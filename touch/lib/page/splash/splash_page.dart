import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch/util/app_constant.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, AppConstant.pageWelcome);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Top SkyScraper
            Positioned(
              top: -100,
              left: 0,
              child: Image.asset(
                AppConstant.splashSkyscraper1,
                width: size.width * 1,
              ),
            ),

            // Bottom SkyScraper
            Positioned(
              bottom: -100,
              left: 0,
              child: Image.asset(
                AppConstant.splashSkyscraper2,
                width: size.width * 1,
              ),
            ),

            // Logo
            Positioned(
              top: 220,
              left: 50,
              right: 50,
              child: Image.asset(
                "assets/images/touch.png",
                width: size.width * 1,
              ),
            ),

            // Link Logo (Pub)
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Animated Text
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    RotateAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      textAlign: TextAlign.center,
                      text: ["TOUCH OTHER", "LIVES WITH", "YOUR STEPS"],
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "NexaLight",
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
