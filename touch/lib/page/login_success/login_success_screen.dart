// Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/util/size_config.dart';

// Components
import 'components/body.dart';

// Login Success Screen
class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
