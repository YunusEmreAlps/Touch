import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:touch/util/app_constant.dart';

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final String identity;
  final Image image;
  final Color color;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.identity,
    @required this.image,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: AppConstant.kPrimaryColor,
                  fontFamily: 'NexaLight',
                  fontSize: 14,
                ),
              ),
              achieved < total
                  ? Image.asset(
                      'assets/images/down_orange.png',
                      width: 20,
                    )
                  : Image.asset(
                      'assets/images/up_red.png',
                      width: 20,
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: achieved / (total < achieved ? achieved : total),
            circularStrokeCap: CircularStrokeCap.round,
            center: image,
            progressColor: color,
            backgroundColor: AppConstant.kPrimaryColor.withAlpha(30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'NexaLight',
                  color: Colors.orange[600],
                ),
              ),
              TextSpan(
                text: ' $identity',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'NexaLight',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
