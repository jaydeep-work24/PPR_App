import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';

import '../utils/Strings.dart';

BuildContext? ctxNDS;

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage(BuildContext ctxNDS1, {Key? key}) : super(key: key) {
    ctxNDS = ctxNDS1;
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
                builder: (ctxProg) => MyNewsDetailPage(),
              ),
            ),
          );
        });
  }
}

class MyNewsDetailPage extends StatefulWidget {
  const MyNewsDetailPage({Key? key}) : super(key: key);

  @override
  MyNewsDetailPageState createState() => MyNewsDetailPageState();
}

class MyNewsDetailPageState extends State<MyNewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBar),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                            Navigator.of(ctxNDS!).pop();
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
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 10.sp),
                height: mainHeight,
                width: mainWidth,
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
                      padding: EdgeInsets.only(left: 20.sp, bottom: 5.sp),
                      // margin: EdgeInsets.only(left: 3.sp),
                      alignment: Alignment.centerLeft,
                      color: ColorAll.colorPreference,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "PM Unveils National Emblem-Roof Of \nNew Parliament Building",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorAll.colorPrimaryDark,
                                  fontSize: 16.sp,
                                  fontFamily: 'DMSans_Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 30.sp,
                                margin: EdgeInsets.only(left: 20.sp),
                                padding: EdgeInsets.only(left: 6.sp),
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/share.png',
                                    color: ColorAll.colorAccent,
                                    height: 24.sp,
                                    width: 24.sp,
                                  ),
                                ),
                              ),
                            ],
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Container(
                            height: mainHeight,
                            margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    "New Delhi: ",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorAll.colorPrimaryDark,
                                      fontSize: 16.sp,
                                      fontFamily: 'DMSans_Regular',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Expanded(
                                    child: Text(
                                      Strings.news_desc,
                                      // maxLines: 20,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
