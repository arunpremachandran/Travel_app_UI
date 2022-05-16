import 'dart:ui';
import 'package:dot_tab_indicator/dot_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/models/beach_model.dart';
import 'package:travel_app/models/popular_model.dart';
import 'package:travel_app/models/recommended_model.dart';
import 'package:travel_app/widgets/bottom_navigation_bar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Page Controller
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarTravel(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left:28.8, right:28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                      color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assests/svg/icon_drawer.svg'),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assests/svg/icon_search.svg'),
                    )
                  ],
                ),
              ),
              //Text widget for title
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 28.8),
                  child: Text('Explore\nthe Nature', style: GoogleFonts.playfairDisplay(
                    fontSize: 45.6, fontWeight: FontWeight.w700
                  ),)
              ),
              //custom Tab bar with custom Indicator
              Container(
                height: 45,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(length: 4, child: TabBar(labelPadding:EdgeInsets.only(left:14.5, right: 14.5),
                  indicatorPadding: EdgeInsets.only(left:14.5, right: 14.5),
                  isScrollable: true,
                  unselectedLabelColor: Colors.blueGrey,
                  labelColor: Colors.black,
                  labelStyle: GoogleFonts.lato(
                    fontSize:15, fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle: GoogleFonts.lato(
                      fontSize:15, fontWeight: FontWeight.w700
                  ),
                  indicator: DotTabIndicator(
                  indicatorColor: Colors.black,
                  radius: kDefaultDotIndicatorRadius,
                  ),
                    indicatorWeight: 2 * kDefaultDotIndicatorRadius,
                  tabs: [
                  Tab(
                    child: Container(
                      child: Text('Recommended'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Popular'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('New Destination'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Hidden Gems'),
                    ),
                  ),
                ],),),
              ),

              //ListView widget with pageview
              //Recommendation section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top:16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      recommendations.length, (int index) => Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 333.6,
                      height: 218.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(recommendations[index].image.toString()),
                          ),
                      ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            bottom: 19.2,
                            left: 19.2,
                            child: ClipRRect(borderRadius: BorderRadius.circular(4.8),
                            child: BackdropFilter(filter: ImageFilter.blur(
                              sigmaY: 19.2,
                              sigmaX: 19.2
                            ),
                              child: Container(
                                height: 36,
                                padding: EdgeInsets.only(left: 36.72,
                                right: 14.4),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assests/svg/icon_location.svg'
                                    ),
                                    SizedBox(width: 9.52,
                                    ),
                                    Text(recommendations[index].name.toString(),
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16.8,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                        ))
                      ],
                    ),
                  )),
                )
              ),
              //Dots Indicator
              //Using SmoothPageIndicator Library
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xFF8a8a8a),
                    dotColor: Color(0xFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8),
                ),
              ),
              //Text Widget for popular Categories
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Popular Categories',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),),
                    Text('Show All',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8a8a8a),
                      ),
                    )
                  ],
                ),
              ),
              //List view for the Popular categories section
              Container(
                margin: EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(itemCount: populars.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10, right: 20),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(right: 15.2),
                    height: 45.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: Color(populars[index].color!),),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 19.2,
                        ),
                        Image.asset(
                          populars[index].image!,
                          height: 15,
                        ),
                        SizedBox(
                          width: 19.2,
                        ),
                      ],
                    ),
                  );
                },),
              ),

              //List view for beach section
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                    itemCount: beaches.length,
                    padding: EdgeInsets.only(left: 20, right: 22),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        height: 124.8,
                        width: 188.4,
                        margin: EdgeInsets.only(right: 16.8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(beaches[index].image),
                            ),
                        ),
                      );
                    },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
