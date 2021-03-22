// Libraries
import 'package:flutter/material.dart';
import 'package:touch/util/size_config.dart';

// Button
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.buttonColor,
    this.textColor,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  final Color textColor;
  final Color buttonColor;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: buttonColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: textColor,
          ),
        ),
      ),
    );
  }
}
