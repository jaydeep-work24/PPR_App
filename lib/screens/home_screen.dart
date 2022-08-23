import 'package:avatar_stack/avatar_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/main.dart';
import 'package:ppr/screens/about_us.dart';
import 'package:ppr/screens/candidates_near_me.dart';
import 'package:ppr/screens/contact_us.dart';
import 'package:ppr/screens/edit_address.dart';
import 'package:ppr/screens/edit_basic_details.dart';
import 'package:ppr/screens/faqs.dart';
import 'package:ppr/screens/latest_news.dart';
import 'package:ppr/screens/news_detail_screen.dart';
import 'package:ppr/screens/notifications.dart';
import 'package:ppr/screens/poll_detail.dart';
import 'package:ppr/screens/poll_result.dart';
import 'package:ppr/screens/privacy_policy.dart';
import 'package:ppr/screens/terms_conditions.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/MySharedPreferences.dart';
import 'package:ppr/utils/Strings.dart';

import 'edit_social_handles.dart';

BuildContext? ctxHS;

class HomePage extends StatelessWidget {
  HomePage(BuildContext ctxHS1, {Key? key}) : super(key: key) {
    ctxHS = ctxHS1;
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = Strings.app_name;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appTitle,
            home: ProgressHUD(
              backgroundColor: Colors.white,
              indicatorColor: ColorAll.colorPrimaryDark,
              textStyle: TextStyle(
                color: ColorAll.colorPrimaryDark,
                fontSize: 18.sp,
              ),
              child: Builder(
                builder: (ctxProg) => MyHomePage(),
              ),
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  final pages = [
    const MyHome(),
    const MyPolls(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mainWidth * 0.20,
      margin: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: ColorAll.colorPrimaryDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Image.asset(
                          'assets/images/home.png',
                          height: 32,
                          width: 32,
                        )
                      : Image.asset(
                          'assets/images/home_outlined.png',
                          height: 32,
                          width: 32,
                        ),
                ),
                pageIndex == 0
                    ? Text(
                        Strings.home,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorAccent),
                      )
                    : Text(
                        Strings.home,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorButton),
                      ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Image.asset(
                          'assets/images/pieslice.png',
                          height: 32,
                          width: 32,
                        )
                      : Image.asset(
                          'assets/images/piechart.png',
                          color: null,
                          height: 32,
                          width: 32,
                        ),
                ),
                pageIndex == 1
                    ? Text(
                        Strings.polls,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorAccent),
                      )
                    : Text(
                        Strings.polls,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorButton),
                      ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Image.asset(
                          'assets/images/user_fill.png',
                          height: 32,
                          width: 32,
                        )
                      : Image.asset(
                          'assets/images/user.png',
                          height: 32,
                          width: 32,
                        ),
                ),
                pageIndex == 2
                    ? Text(
                        Strings.account,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorAccent),
                      )
                    : Text(
                        Strings.account,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorAll.colorButton),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  int _current = 0;
  final bannerList = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    bannerList
        .add("https://greentattva.in/wp-content/uploads/2021/10/bannerrr.png");
    bannerList.add(
        "https://greentattva.in/wp-content/uploads/2021/10/Banner1-.1.png");
  }

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ColorAll.colorAccent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.red,
        padding: EdgeInsets.only(top: statusBar),
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.lightGreen,
            padding: EdgeInsets.only(bottom: mainWidth * 0.20.sp + 30.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: ColorAll.colorAccent,
                      height: mainWidth * 0.35,
                      width: mainWidth,
                    ),
                    Container(
                      color: ColorAll.colorAccent,
                      height: mainWidth * 0.20,
                      padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                      child: Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.of(ctxHS!).pop();
                                },
                                child: Image.asset(
                                  'assets/images/menu_icon.png',
                                  height: 32,
                                  width: 32,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Namaste Armaan!",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35.sp,
                          width: 35.sp,
                          padding: EdgeInsets.only(left: 10.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NotificationsPage(context),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/bell.png',
                              height: 24.sp,
                              width: 24.sp,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: mainWidth * 0.18),
                      width: mainWidth,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.24,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * 0.24,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 8),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 3000),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                pauseAutoPlayOnTouch: true,
                                viewportFraction: 0.8,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                              items: bannerList.map((card) {
                                return Builder(builder: (BuildContext context) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 5.sp,
                                      right: 5.sp,
                                      top: 10.sp,
                                      bottom: 10.sp,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          15.sp,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15.sp,
                                          ),
                                          child: FadeInImage(
                                            image: NetworkImage(
                                              card,
                                            ),
                                            placeholder: AssetImage(
                                              "assets/images/splash_logo.png",
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: map<Widget>(bannerList, (index, url) {
                                  return Container(
                                    width: 7.0,
                                    height: 7.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current == index
                                          ? ColorAll.colorPrimaryDark
                                          : Colors.grey,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: mainWidth,
                  height: mainWidth * 0.93.sp,
                  margin: EdgeInsets.only(top: 20.sp),
                  color: ColorAll.colorAccentDark,
                  child: Column(children: [
                    Stack(
                      children: [
                        Container(
                          height: mainWidth * 0.25.sp,
                          width: mainWidth * 0.95.sp,
                          margin: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/around_back.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: mainWidth * 0.08.sp,
                              right: mainWidth * 0.08.sp,
                            ),
                            child: Row(children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/peoples.png',
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Explore Political personalities Around you!"
                                              .toUpperCase(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 35.sp,
                                width: 35.sp,
                                padding: EdgeInsets.only(left: 10.sp),
                                child: InkWell(
                                  child: Image.asset(
                                    'assets/images/circle_right.png',
                                    color: ColorAll.colorAccent
                                        .withOpacity(0.6.sp),
                                    height: 24.sp,
                                    width: 24.sp,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: mainWidth * 0.02.sp,
                        right: mainWidth * 0.02.sp,
                      ),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            height: 35.sp,
                            padding: EdgeInsets.only(left: 10.sp),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Strings.candidates_near_me,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              ctxHS!,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CandidateNearMePage(context),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 5),
                                child: Text(
                                  "See All",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                              Image.asset(
                                'assets/images/circle_right.png',
                                color: Colors.black,
                                height: 18.sp,
                                width: 18.sp,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10.sp,
                      ),
                      // margin: EdgeInsets.only(bottom: 5.sp),
                      height: MediaQuery.of(context).size.width * 0.51,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, indexCat) {
                          return Container(
                            height: mainWidth * 0.45,
                            width: mainWidth * 0.35,
                            padding: EdgeInsets.only(
                              left: 5.sp,
                            ),
                            margin: EdgeInsets.only(
                              left: 0.sp,
                              right: 0.sp,
                              top: 10.sp,
                              bottom: 0.sp,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                // borderRadius: BorderRadius.circular(10.0),
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                            "assets/images/candidate.png",
                                            fit: BoxFit.fill,
                                            height: mainWidth * 0.40,
                                            width: mainWidth * 0.35,
                                          ),
                                        ),
                                        Expanded(
                                          // flex: 1,
                                          child: Container(
                                            width: mainWidth * 0.35,
                                            // margin: EdgeInsets.only(left: 3.sp),
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                              ),
                                              color: Colors.white,
                                            ),
                                            // padding: EdgeInsets.only(
                                            //   right: 5.sp,
                                            //   left: 5.sp,
                                            // ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    "Harsh Sanghvi",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: ColorAll
                                                          .colorPrimaryDark,
                                                      fontSize: 15.sp,
                                                      fontFamily:
                                                          'DMSans_Regular',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child: Text(
                                                    "MLA (Active)",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color:
                                                          ColorAll.textColors,
                                                      fontSize: 12.sp,
                                                      fontFamily:
                                                          'DMSans_Regular',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: mainWidth * 0.02.sp,
                    right: mainWidth * 0.02.sp,
                    top: 10.sp,
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        height: 35.sp,
                        padding: EdgeInsets.only(left: 10.sp),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Strings.latest_news,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          ctxHS!,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LatestNewsPage(context),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 5),
                            child: Text(
                              "See All",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          Image.asset(
                            'assets/images/circle_right.png',
                            color: Colors.black,
                            height: 18.sp,
                            width: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10.sp,
                  ),
                  margin: EdgeInsets.only(bottom: 10.sp),
                  height: MediaQuery.of(context).size.width * 0.65,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, indexCat) {
                      return Container(
                        // height: mainWidth * 0.35,
                        width: mainWidth * 0.85,
                        padding: EdgeInsets.only(
                          left: 5.sp,
                        ),
                        margin: EdgeInsets.only(
                          left: 0.sp,
                          right: 0.sp,
                          top: 10.sp,
                          bottom: 0.sp,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              ctxHS!,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsDetailPage(context),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/latest_news.png",
                                  fit: BoxFit.fill,
                                  // height: mainWidth * 0.40,
                                  width: mainWidth * 0.85,
                                ),
                              ),
                              Expanded(
                                // flex: 1,
                                child: Container(
                                  width: mainWidth * 0.85,
                                  // margin: EdgeInsets.only(left: 3.sp),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                    color: ColorAll.colorPreference,
                                  ),
                                  // padding: EdgeInsets.only(
                                  //   right: 5.sp,
                                  //   left: 5.sp,
                                  // ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "PM Unveils National Emblem-Roof Of New Parliament Building",
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: ColorAll.colorPrimaryDark,
                                            fontSize: 16.sp,
                                            fontFamily: 'DMSans_Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: Text(
                                          "Feb 13, 2022",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: ColorAll.textColors,
                                            fontSize: 12.sp,
                                            fontFamily: 'DMSans_Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPolls extends StatefulWidget {
  const MyPolls({Key? key}) : super(key: key);

  @override
  MyPollsState createState() => MyPollsState();
}

class MyPollsState extends State<MyPolls> with TickerProviderStateMixin {
  int _current = 0;
  final bannerList = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ColorAll.colorAccent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    var _tab = TabBar(
      indicatorWeight: 10,
      // indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.only(bottom: 0, top: 0, left: 30, right: 30),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorAll.colorAccent,
            width: 5.0,
          ),
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      onTap: (value) {
        print(value);
      },
      unselectedLabelColor: ColorAll.tabTextColors,
      controller: _tabController,
      labelColor: Colors.black,
      tabs: [
        Tab(
          text: "All Live Polls",
        ),
        Tab(
          text: "My Polls",
        ),
      ],
    );

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorAll.colorAccent,
          title: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 40.sp, top: 5.sp),
            child: Text(
              Strings.polls,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSans_Regular',
                  color: Colors.white),
            ),
          ),
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(
                  ctxHS!,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NotificationsPage(context),
                  ),
                );
              },
              child: Container(
                height: 30.sp,
                width: 30.sp,
                padding: EdgeInsets.only(right: 10.sp),
                margin: EdgeInsets.only(right: 20.sp),
                child: Image.asset(
                  'assets/images/bell.png',
                  height: 24.sp,
                  width: 24.sp,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: _tab.preferredSize,
            child: ColoredBox(
              color: ColorAll.tabBackColors,
              child: _tab,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              height: mainHeight * 0.90,
              width: mainWidth,
              child: ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, indexCat) {
                  return Container(
                    // height: mainWidth * 0.35,
                    // height: mainWidth * 0.62.sp,
                    padding: EdgeInsets.only(left: 10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0.sp),
                      ),
                      color: ColorAll.colorPreference,
                    ),
                    width: mainWidth,
                    margin: EdgeInsets.only(
                      left: 0.sp,
                      right: 0.sp,
                      top: 10.sp,
                      bottom: 0.sp,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "POLL #1",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorAll.colorAccent,
                              fontSize: 12.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.sp),
                          child: Text(
                            "Who should be the next AMC Corporator from Satellite-Ward 42, Ahmedabad?",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Feb 13, 2022",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 12.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8.sp,
                              right: 8.sp,
                              top: 10.sp,
                              bottom: 8.sp,
                            ),
                            child: AvatarStack(
                              height: 50,
                              avatars: [
                                for (var n = 0; n < 15; n++)
                                  NetworkImage(
                                      'https://i.pravatar.cc/150?img=$n'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.sp),
                          child: Row(
                            children: [
                              Container(
                                height: 20.sp,
                                width: 20.sp,
                                child: Image.asset(
                                  'assets/images/timer.png',
                                  height: 20.sp,
                                  width: 20.sp,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "01d:04h:45m left",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorAll.colorAccentDark,
                          margin: EdgeInsets.only(
                            top: 15.sp,
                            right: 10.sp,
                          ),
                          height: 1.sp,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PollDetailPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View Poll Details",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 16.sp,
                                  width: 16.sp,
                                  margin: EdgeInsets.only(left: 8.sp),
                                  child: Image.asset(
                                    'assets/images/circle_right.png',
                                    color: Colors.black,
                                    height: 16.sp,
                                    width: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              height: mainHeight * 0.90,
              width: mainWidth,
              child: ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, indexCat) {
                  return Container(
                    // height: mainWidth * 0.55.sp,
                    padding: EdgeInsets.only(left: 10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0.sp),
                      ),
                      color: ColorAll.colorPreference,
                    ),
                    width: mainWidth,
                    margin: EdgeInsets.only(
                      left: 0.sp,
                      right: 0.sp,
                      top: 10.sp,
                      bottom: 0.sp,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "POLL #1",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorAll.colorAccent,
                              fontSize: 12.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.sp),
                          child: Text(
                            "Who should be the next AMC Corporator from Satellite-Ward 42, Ahmedabad?",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Jan 10, 2022 - Jan 17, 2022",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 12.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8.sp,
                              right: 8.sp,
                              top: 10.sp,
                              bottom: 8.sp,
                            ),
                            child: AvatarStack(
                              height: 50,
                              avatars: [
                                for (var n = 0; n < 15; n++)
                                  NetworkImage(
                                      'https://i.pravatar.cc/150?img=$n'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.sp),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Result:",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Amarlaal Swamy",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorAll.colorAccentDark,
                          margin: EdgeInsets.only(
                            top: 15.sp,
                            right: 10.sp,
                          ),
                          height: 1.sp,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.sp, bottom: 15.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PollResultPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View Poll Details",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 16.sp,
                                  width: 16.sp,
                                  margin: EdgeInsets.only(left: 8.sp),
                                  child: Image.asset(
                                    'assets/images/circle_right.png',
                                    color: Colors.black,
                                    height: 16.sp,
                                    width: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  MyAccountState createState() => MyAccountState();
}

class MyAccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ColorAll.colorAccent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.red,
        padding: EdgeInsets.only(top: statusBar),
        child: Container(
          // color: Colors.lightGreen,
          padding: EdgeInsets.only(bottom: mainWidth * 0.20.sp + 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorAll.colorAccent,
                height: mainHeight * 0.10,
                padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "My ${Strings.account}",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'DMSans_Regular',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              MySharedPreferences.instance.removeAll();
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SplashPage(title: 'PPR'),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/exit.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: mainHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0.sp),
                    bottomRight: Radius.circular(20.0.sp),
                  ),
                  color: ColorAll.colorAccent,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Image.asset(
                        'assets/images/my_user.png',
                        height: 100.sp,
                        width: 100.sp,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/menu_icon.png',
                                    height: 24.sp,
                                    width: 24.sp,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Text(
                                        "Bharatiya Janta Party",
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'DMSans_Regular',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // height: 700.sp,
                  margin: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0.sp),
                    ),
                    color: ColorAll.colorPreference,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditbasicDetailPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/editBasicDetail.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.edit_basic_details,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditAddressPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/mapAddress.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.edit_address,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditSocialHandlesPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/usersthree.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.edit_social_handles,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TermsAndConditionsPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/note.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.terms_conditions,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PrivacyPolicyPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/privacy.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.txt_privacy_policy,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AboutUsPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/about_us.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.about_us,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContactUsPage(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/contact_us.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.contact_us,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          color: ColorAll.colorAccentDark,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                ctxHS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FAQs(context),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/faq.png',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.FAQs,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 12.sp,
                                  width: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
