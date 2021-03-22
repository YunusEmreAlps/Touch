import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/widget/homepage/categories.dart';
import 'package:touch/widget/section_title.dart';
import 'package:touch/widget/special_offers.dart';
import 'package:touch/model/post.dart';
import 'package:touch/page/details/details_screen.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.post,
    this.press,
  }) : super(key: key);

  final double width, aspectRetio;
  final Post post;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Categories(),
          SpecialOffers(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20.0),
                vertical: getProportionateScreenWidth(20.0)),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(title: "Charities", press: () {}),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...List.generate(
                      list.length,
                      (index) {
                        if (list[index] != null)
                          return _cards(context, list[index]);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(24)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cards(context, Post model) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(model: model),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(model.avatar)
                      // image: NetworkImage(person.avatar),
                      ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.white,
                      offset: Offset(4, 4),
                    )
                  ]),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.title[0].toUpperCase() + model.title.substring(1),
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 5),
                Text(
                  (model.post_description.length <= 25)
                      ? (model.post_description)
                      : (model.post_description.substring(0, 25) + '...'),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  "${model.payment} STEP",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppConstant.kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
