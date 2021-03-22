import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:touch/util/app_constant.dart';
import 'package:persist_theme/persist_theme.dart';
// import 'package:touch/model/auth.dart';


// Stateful widget for managing name data
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _auth = Provider.of<AuthModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppConstant.pageProfile);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.kPrimaryColor,
          ),
        ),
        elevation: 0,
        backgroundColor: AppConstant.colorPageBg,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'NexaLight',
            letterSpacing: 2,
            color: AppConstant.kPrimaryColor,
          ),
        ),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: ListBody(
          children: <Widget>[
            Container(
              height: 10.0,
            ),
          ],
        ),
      )),
    );
  }
}
