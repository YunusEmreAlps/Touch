// Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/util/size_config.dart';

// Components
import 'components/body.dart';

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false, // RenderFlex error solution
    );
  }
}