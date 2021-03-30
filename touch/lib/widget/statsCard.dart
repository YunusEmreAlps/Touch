import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:touch/util/app_constant.dart';

import 'package:touch/widget/card.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: BoxDecoration(
                      gradient: AppConstant.kPrimaryGradientColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3489",
                            style: TextStyle(
                                fontFamily: 'NexaLight',
                                fontSize: 18,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Image.asset(
                          'assets/images/dollar.png',
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  /*Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VideoPage(),
                    ),
                  );*/
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Statistics",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Color(0xFF535353),
                    fontFamily: 'NexaLight',
                    fontSize: 16),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
