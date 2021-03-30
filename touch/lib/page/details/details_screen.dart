import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:touch/model/post.dart';
import 'package:touch/store/sharedpreferences/sharedpreferences.dart';
// import 'package:touchpay/sharedpreferences/sharedpreferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/page/details/components/body.dart';

// Structure
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.model}) : super(key: key);
  final Post model;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void stepInfo() {
    Pedometer.stepCountStream.listen(onStepCount);
  }

  void onStepCount(StepCount event) {
    print("yürüme:" + event.toString());
    int step = event.steps;
    if (!mounted) return;
    Pref().saveInt("step", event.steps);
  }

  @override
  Widget build(BuildContext context) {
    stepInfo();
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        model: widget.model,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.model.mail, widget.model.title, '');
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  // Sending Mail Function
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppConstant.colorPageBg,
      /*flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppConstant.kPrimaryGradientColor,
        ),
      ),*/
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstant.pageHome);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppConstant.kPrimaryColor,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.model.title,
        style: TextStyle(
          fontFamily: 'NexaLight',
          letterSpacing: 2,
          color: AppConstant.kPrimaryColor,
        ),
      ),
    );
  }
}
