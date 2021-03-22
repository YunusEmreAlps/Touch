// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';

// Divider
class OrDivider extends StatelessWidget {
  const OrDivider({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.02),
      width: SizeConfig.screenWidth * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(
                color: AppConstant.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color:  Color(0xFFF5F6F9),
        height: 1.5,
      ),
    );
  }
}