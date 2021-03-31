import 'dart:collection';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/widget/card.dart';
import 'package:touch/widget/statsCard.dart';
import 'package:touch/widget/sectionHeader.dart';

class LeaderboardPage extends StatefulWidget {
  LeaderboardPage({
    Key key,
    @required this.onMenuTap,
  }) : super(key: key);
  final Function onMenuTap;

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  PageController _pageController = PageController(initialPage: 0);
  TextEditingController controller = TextEditingController();
  int _selectedCategory = 0;
  bool isEmpty = false;
  bool local;
  final List names = [
    'Frodo Baggins',
    'Samwise Gamgee',
    'Maurice Moss',
    'Jen Barber',
    'Roy',
    'Gandalf',
    'Legolas',
    'Aragorn',
    'Bilbo Baggins',
  ];

  final List coins = [
    '3895',
    '3678',
    '3675',
    '3456',
    '3455',
    '3454',
    '3453',
    '3452',
    '3451',
  ];

  final List colors = [
    Color(0xFFFFD700),
    Color(0xFFC0C0C0),
    Color(0xFFCD7F32),
    Color(0xFF0396FF),
    Color(0xFF0396FF),
    Color(0xFF0396FF),
    Color(0xFF0396FF),
    Color(0xFF0396FF),
    Color(0xFF0396FF),
    Color(0xFF0396FF)
  ];
  @override
  void initState() {
    local = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.leaderboard,
            color: AppConstant.kPrimaryColor,
          ),
          onPressed: () {
            setState(() {
              isEmpty = !isEmpty;
            });
          },
        ),
        elevation: 0,
        // backgroundColor: Color(0xFFFFECDF),
        backgroundColor: AppConstant.colorPageBg,
        centerTitle: true,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontFamily: 'NexaLight',
            letterSpacing: 2,
            color: AppConstant.kPrimaryColor,
          ),
        ),
        actions: <Widget>[
          Transform.rotate(
            angle: 180 * pi / 180,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppConstant.pageHome);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppConstant.kPrimaryColor,
              ),
            ),
          ),
        ],
        brightness: Brightness.light,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: local
                ? CustomScrollView(
                    slivers: <Widget>[
                      SliverFixedExtentList(
                          delegate:
                              SliverChildListDelegate.fixed([Container()]),
                          itemExtent: MediaQuery.of(context).size.height * 0.1),
                      SliverToBoxAdapter(
                        child: SectionHeader(
                          text: 'Leaderboard',
                          onPressed: () {},
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 14),
                                    child: CardWidget(
                                      gradient: false,
                                      button: false,
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${index + 1}.",
                                              style: TextStyle(
                                                  fontFamily: 'NexaLight',
                                                  fontSize: 18,
                                                  color: Color(0xFF585858)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${names[index]}",
                                              style: TextStyle(
                                                  fontFamily: 'NexaLight',
                                                  fontSize: 18,
                                                  color: Color(0xFF585858)),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Text(
                                                    "${coins[index]}",
                                                    style: TextStyle(
                                                        fontFamily: 'NexaLight',
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF585858)),
                                                  ),
                                                  Image.asset(
                                                    AppConstant.pngCoin,
                                                    width: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      height: 60,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankGolden,
                                width: 25,
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankSilver,
                                width: 25,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankBronze,
                                width: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SectionHeader(
                          text: 'My Statistics',
                          onPressed: () {},
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 245,
                          child: StatsCard(),
                        ),
                      ),
                    ],
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverFixedExtentList(
                          delegate:
                              SliverChildListDelegate.fixed([Container()]),
                          itemExtent: MediaQuery.of(context).size.height * 0.1),
                      SliverToBoxAdapter(
                        child: SectionHeader(
                          text: 'Leaderboard',
                          onPressed: () {},
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: names.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 14),
                                    child: CardWidget(
                                      gradient: false,
                                      button: false,
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${index + 1}.",
                                              style: TextStyle(
                                                  fontFamily: 'NexaLight',
                                                  fontSize: 18,
                                                  color: Color(0xFF585858)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${names[index]}",
                                              style: TextStyle(
                                                  fontFamily: 'NexaLight',
                                                  fontSize: 18,
                                                  color: Color(0xFF585858)),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Text(
                                                    "${coins[index]}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'NexaLight',
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF585858)),
                                                  ),
                                                  Image.asset(
                                                    AppConstant.pngCoin,
                                                    width: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      height: 60,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankGolden,
                                width: 25,
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankSilver,
                                width: 25,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 15,
                              child: Image.asset(
                                AppConstant.rankBronze,
                                width: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Positioned(
            top: 0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  local = true;
                                });
                              },
                              child: Text(
                                "Local",
                                style: TextStyle(
                                  fontFamily: 'NexaLight',
                                  letterSpacing: 2,
                                  color: Color(0xFF343434),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  local = false;
                                });
                              },
                              child: Text(
                                "Global",
                                style: TextStyle(
                                  fontFamily: 'NexaLight',
                                  letterSpacing: 2,
                                  color: Color(0xFF343434),
                                ),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: AnimatedContainer(
                    margin: local
                        ? EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.33 - 35)
                        : EdgeInsets.only(
                            left:
                                MediaQuery.of(context).size.width * 0.67 - 10),
                    width: 40,
                    height: 4,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: AppConstant.kPrimaryColor,
                        borderRadius: BorderRadius.circular(500)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
}
