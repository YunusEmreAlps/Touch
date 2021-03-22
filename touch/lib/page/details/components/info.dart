// Libraries
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:touch/model/post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/size_config.dart';

// User
class Info extends StatelessWidget {
  const Info({
    Key key,
    this.title,
    this.post_description,
    this.avatar,
  }) : super(key: key);
  final String title, post_description, avatar;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defaultSize * 30, // 300
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 21, // 210
              decoration: BoxDecoration(
                color: AppConstant.colorPageBg
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // User Picture
                Container(
                  margin: EdgeInsets.only(bottom: defaultSize * 1.6), // 16
                  height: defaultSize * 20, // 200
                  width: defaultSize * 20, // 200
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * 0.8, // 8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(avatar),
                    ),
                  ),
                ),
                // Donation Name
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NexaLight',
                    fontSize: defaultSize * 2.8, // 28
                    color: AppConstant.kTextColor,
                  ),
                ),
                SizedBox(height: defaultSize / 5), // 2
                // User Email
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        post_description,
                        style: TextStyle(
                          fontFamily: 'NexaLight',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8492A2),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Text(
                  post_description,
                  style: TextStyle(
                    fontFamily: 'NexaLight',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
