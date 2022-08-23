import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxAUS;

class AboutUsPage extends StatelessWidget {
  AboutUsPage(BuildContext ctxAUS1, {Key? key}) : super(key: key) {
    ctxAUS = ctxAUS1;
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
                builder: (ctxProg) => MyAboutUsPage(),
              ),
            ),
          );
        });
  }
}

class MyAboutUsPage extends StatefulWidget {
  const MyAboutUsPage({Key? key}) : super(key: key);

  @override
  MyAboutUsPageState createState() => MyAboutUsPageState();
}

class MyAboutUsPageState extends State<MyAboutUsPage> {
  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBar),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorAll.colorAccent,
              height: mainHeight * 0.10.sp,
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(children: [
                Expanded(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(ctxAUS!).pop();
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
                            Strings.about_us,
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
              ]),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 15.sp),
                padding: EdgeInsets.only(top: 20.sp, left: 20.sp, right: 20.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/splash_logo.png',
                          height: mainHeight * 0.20.sp,
                          width: mainWidth * 0.62.sp,
                        ),
                      ),
                      Text(
                        Strings.about_us_desc,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontFamily: 'DMSans_Regular',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        color: ColorAll.colorBgHome,
                        margin: EdgeInsets.only(
                          top: 15.sp,
                        ),
                        height: 1.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.sp),
                        child: Text(
                          "Some Marvels of PPR",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ColorAll.colorPrimaryDark,
                            fontFamily: 'DMSans_Regular',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.sp,bottom: 10.sp),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/marvels.png',
                                  height: 28.sp,
                                  width: 28.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      "Dummy Charactersitic of PPR 1",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorAll.colorPrimaryDark,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.sp,bottom: 10.sp),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/marvels.png',
                                  height: 28.sp,
                                  width: 28.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      "Dummy Charactersitic of PPR 2",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorAll.colorPrimaryDark,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.sp,bottom: 10.sp),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/marvels.png',
                                  height: 28.sp,
                                  width: 28.sp,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      "Dummy Charactersitic of PPR 3",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorAll.colorPrimaryDark,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
