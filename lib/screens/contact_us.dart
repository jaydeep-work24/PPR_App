import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/help_support.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxCUS;

class ContactUsPage extends StatelessWidget {
  ContactUsPage(BuildContext ctxCUS1, {Key? key}) : super(key: key) {
    ctxCUS = ctxCUS1;
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
                builder: (ctxProg) => MyContactUsPage(),
              ),
            ),
          );
        });
  }
}

class MyContactUsPage extends StatefulWidget {
  const MyContactUsPage({Key? key}) : super(key: key);

  @override
  MyContactUsPageState createState() => MyContactUsPageState();
}

class MyContactUsPageState extends State<MyContactUsPage> {
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
                          Navigator.of(ctxCUS!).pop();
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
                            Strings.contact_us,
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
                          'assets/images/contact_us_img.png',
                          height: 142.sp,
                          width: 124.sp,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.sp,
                        ),
                        child: Text(
                          Strings.contact_us_desc,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontFamily: 'DMSans_Regular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  ctxCUS!,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HelpAndSuppotPage(context),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/contact_msg.png',
                                    height: 32.sp,
                                    width: 32.sp,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.sp),
                                          child: Text(
                                            "contact@ppr.com",
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: ColorAll.colorPrimaryDark,
                                              fontFamily: 'DMSans_Regular',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.sp, top: 8.sp),
                                          child: Text(
                                            "Write to us",
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: ColorAll.colorPrimaryDark,
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
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/call.png',
                                  height: 32.sp,
                                  width: 32.sp,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.sp),
                                        child: Text(
                                          "+91-9911224578",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: ColorAll.colorPrimaryDark,
                                            fontFamily: 'DMSans_Regular',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.sp, top: 8.sp),
                                        child: Text(
                                          "Talk with us",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: ColorAll.colorPrimaryDark,
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
