// Libraries
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// Don't Touch
class StepBar extends StatelessWidget {
  final int stepNumber;

  // Constructor
  const StepBar({
    Key key,
    this.stepNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return CircularStepProgressIndicator(
      totalSteps: 10000,
      currentStep: (stepNumber / 4).toInt(),
      stepSize: 10,
      selectedColor: AppConstant.kPrimaryColor,
      unselectedColor: Colors.grey[200],
      padding: 0,
      width: 240,
      height: 240,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon
            Icon(
              Icons.directions_walk_outlined,
              color: AppConstant.kPrimaryColor,
            ),
            SizedBox(height: defaultSize * 5), // 50
            Text(
              (stepNumber).toString() + " TP",
              style: TextStyle(
                fontFamily: 'NexaLight',
                fontSize: defaultSize * 3.8, // 28
                color: AppConstant.kTextColor,
              ),
            ),
            SizedBox(height: defaultSize * 5), // 50
            Text(
              "Total Balance\nAvailable",
              style: TextStyle(fontFamily: 'NexaLight', height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
