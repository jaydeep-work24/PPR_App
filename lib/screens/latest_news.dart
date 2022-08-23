import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/news_detail_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxLNS;

class LatestNewsPage extends StatelessWidget {
  LatestNewsPage(BuildContext ctxLNS1, {Key? key}) : super(key: key) {
    ctxLNS = ctxLNS1;
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
                builder: (ctxProg) => MyLatestNewsPage(),
              ),
            ),
          );
        });
  }
}

class MyLatestNewsPage extends StatefulWidget {
  const MyLatestNewsPage({Key? key}) : super(key: key);

  @override
  MyLatestNewsPageState createState() => MyLatestNewsPageState();
}

class MyLatestNewsPageState extends State<MyLatestNewsPage> {
  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBar),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            Navigator.of(ctxLNS!).pop();
                          },
                          child: Image.asset(
                            'assets/images/ic_back.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              Strings.latest_news,
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
                      ],
                    ),
                  ),
                  Container(
                    height: 30.sp,
                    width: 30.sp,
                    padding: EdgeInsets.only(left: 10.sp),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_search.png',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
                // margin: EdgeInsets.only(bottom: 10.sp),
                height: mainHeight * 0.90,
                width: mainWidth,
                // color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, indexCat) {
                    return Container(
                      // height: mainWidth * 0.35,
                      width: mainWidth,
                      padding: EdgeInsets.only( bottom: 5.sp),
                      margin: EdgeInsets.only(
                        left: 0.sp,
                        right: 0.sp,
                        top: 10.sp,
                        bottom: 0.sp,
                      ),
                      child: InkWell(
                        onTap: () {
                          print(indexCat);
                          Navigator.push(
                            ctxLNS!,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewsDetailPage(context),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/latest_news.png",
                              fit: BoxFit.fill,
                              // height: mainWidth * 0.40,
                              width: mainWidth,
                            ),
                            Container(
                              width: mainWidth,
                              height: mainHeight * 0.10.sp,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
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
                                      ),
                                      Container(
                                        height: 30.sp,
                                        width: 30.sp,
                                        margin: EdgeInsets.only(left: 10.sp,right: 10.sp),
                                        padding: EdgeInsets.only(left: 6.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/circle_right.png',
                                            color: ColorAll.colorAccent,
                                            height: 24.sp,
                                            width: 24.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
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
    );
  }
}
