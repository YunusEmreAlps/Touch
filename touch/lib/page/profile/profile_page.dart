import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:touch/store/sharedpreferences/sharedpreferences.dart';
import 'package:touch/store/stepinfo.dart';
import 'package:touch/util/app_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';
import 'package:touch/widget/profilepage/step_bar.dart';
import 'package:touch/widget/profilepage/status_bar.dart';
import 'package:touch/page/map/google_map.dart';
import 'package:pedometer/pedometer.dart';

// Circular Floating Action Button
import 'package:unicorndial/unicorndial.dart';

class ProfilePage extends StatefulWidget {
  int step = 0;
  int totalPaid = 0;
  int totalStep = 0;
  int availableStep = 0;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController(initialPage: 0);
  Stream<StepCount> _stepCountStream;
  bool isEmpty = false;
  int _selectedCategory = 0;

  // Pedometer
  String _steps = '?';

  void initState() {
    super.initState();
    initPlatformState();
  }

  // bottom sheet
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;

  // Circular Floating Action Button

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    getAvailableStep();
    getTotalStep();
    paid();
    // Floating Action Button
    var childButtons = List<UnicornButton>();
    childButtons.add(
      UnicornButton(
        currentButton: FloatingActionButton(
          heroTag: "Wallet",
          backgroundColor: AppConstant.colorPageBg,
          mini: true,
          child: Icon(
            Icons.account_balance_wallet,
            color: AppConstant.kPrimaryColor,
          ),
          onPressed: _showModalSheet,
        ),
      ),
    );

    childButtons.add(
      UnicornButton(
        currentButton: FloatingActionButton(
          heroTag: "Badges",
          backgroundColor: AppConstant.colorPageBg,
          mini: true,
          child: Icon(
            Icons.shield,
            color: AppConstant.kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppConstant.pageBadge);
          },
        ),
      ),
    );

    childButtons.add(
      UnicornButton(
        currentButton: FloatingActionButton(
          heroTag: "Settings",
          backgroundColor: AppConstant.colorPageBg,
          mini: true,
          child: Icon(
            Icons.settings,
            color: AppConstant.kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppConstant.pageSettings);
          },
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
        backgroundColor: AppConstant.colorPageBg,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'NexaLight',
            letterSpacing: 2,
            color: AppConstant.kPrimaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: ClipOval(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/avatar.jpg"),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppConstant.pageBadge);
            },
          )
        ],
        brightness: Brightness.light,
      ),
      body: // Map Part
          MyMap(),
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: AppConstant.kPrimaryColor,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.list),
          childButtons: childButtons),
    );
  }

  Widget _renderEmptyState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history,
            size: 48,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'No Activity',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstant.colorParagraph2),
          ),
        ],
      ),
    );
  }

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = id;
        });

        _pageController.animateToPage(id,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: _selectedCategory == id
                      ? FontWeight.bold
                      : FontWeight.normal,
                )),
            SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 2,
              width: _selectedCategory == id ? title.length * 4.5 : 0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyItem({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            // Navigator.push(context, CupertinoPageRoute(builder: (context) => WordDetailPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstant.colorPrimary,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Bottom Sheet
  Future<void> _showModalSheet() async {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: SizeConfig.screenHeight / 2,
          color: AppConstant.colorPageBg,
          child: new Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: MaterialButton(
                    minWidth: 328,
                    height: 48,
                    elevation: 0,
                    color: AppConstant.colorDrawerButton,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8)),
                    child: Text(AppConstant.wallet,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConstant.colorHeading)),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.defaultSize / 2),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StepBar(
                                stepNumber: widget.availableStep.toInt(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 250,
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              StatCard(
                                title: 'Total Step',
                                achieved: widget.totalStep.toDouble(),
                                total: 10000,
                                identity: 'STEP',
                                color: AppConstant.kPrimaryColor,
                                image: Image.asset('assets/images/walking.png',
                                    width: 40),
                              ),
                              StatCard(
                                title: 'Calories',
                                achieved: widget.totalStep * 0.05,
                                total: 2500, // per day
                                identity: 'KCAL',
                                color: AppConstant.kPrimaryColor,
                                image: Image.asset('assets/images/fire.png',
                                    width: 40),
                              ),
                              StatCard(
                                title: 'Distance',
                                achieved: (widget.totalStep * 0.0008),
                                total: 1000,
                                identity: 'KM',
                                color: AppConstant.kPrimaryColor,
                                image: Image.asset('assets/images/distance.png',
                                    width: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void paid() async {
    widget.totalPaid = await Pref().loadInt("paid");
    print(widget.totalPaid.toString());
  }

  void onStepCount(StepCount event) {
    setState(() {
      print("Walk:" + event.toString());
      widget.step = event.steps;
      stepCheck(widget.step);
      getTotalStep();
      getAvailableStep();
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void getTotalStep() async {
    widget.totalStep = await totalStep() as int;
  }

  void getAvailableStep() async {
    widget.availableStep = await availableStep() as int;
  }

  Future<void> initPlatformState() async {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
}
