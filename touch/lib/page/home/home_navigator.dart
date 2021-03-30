import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch/page/leaderboard/leaderboard.dart';
import 'package:touch/page/home/home_page.dart';
import 'package:touch/page/profile/profile_page.dart';
import 'package:touch/util/app_constant.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentPage = 1;

  List<Widget> _pages = [LeaderboardPage(), HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ConvexAppBar(
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.kPrimaryColor,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.leaderboard, title: ''), // LeaderBoard
          TabItem(icon: Icons.search, title: ''), // Home
          TabItem(icon: Icons.person, title: ''), // Profile
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
