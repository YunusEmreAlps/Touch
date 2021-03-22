import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:touch/model/badge.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';
import 'package:touch/widget/item_card.dart';

class BadgeScreen extends StatefulWidget {
  @override
  _BadgeScreenState createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  PageController _pageController = PageController(initialPage: 0);
  bool isEmpty = false;

  int _selectedCategory = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppConstant.pageProfile);
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
          'Badges',
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
              setState(() {
                isEmpty = !isEmpty;
              });
            },
          )
        ],
        brightness: Brightness.light,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(16),
              crossAxisCount: 2,
              itemCount: badges.length,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: 200, // 200
                  width: 200, // 200
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppConstant.kPrimaryColor,
                      width: 4, // 8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                      image: AssetImage(badges[index].image),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        badges[index].title,
                        style: TextStyle(
                          fontFamily: 'NexaLight',
                          letterSpacing: 2,
                          color: AppConstant.kPrimaryColor,
                        ),
                      ),
                      Text(
                        'Level ${badges[index].id}',
                        style: TextStyle(
                          color: AppConstant.kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          ),
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
}
