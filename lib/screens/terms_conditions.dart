import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxTACS;

class TermsAndConditionsPage extends StatelessWidget {
  TermsAndConditionsPage(BuildContext ctxTACS1, {Key? key}) : super(key: key) {
    ctxTACS = ctxTACS1;
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
                builder: (ctxProg) => MyTermsAndConditionsPage(),
              ),
            ),
          );
        });
  }
}

class MyTermsAndConditionsPage extends StatefulWidget {
  const MyTermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  MyTermsAndConditionsPageState createState() =>
      MyTermsAndConditionsPageState();
}

class MyTermsAndConditionsPageState extends State<MyTermsAndConditionsPage> {
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
                          Navigator.of(ctxTACS!).pop();
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
                            Strings.terms_conditions,
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
                padding: EdgeInsets.only(top:20.sp,left: 20.sp,right: 20.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Updated at Jul 19, 2022",
                        maxLines: 1,
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
                        padding: EdgeInsets.only(top:15.sp),
                        child: Text(
                          "General Terms",
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
                        padding: EdgeInsets.only(left: 5.sp, top: 10.sp),
                        child: Text(
                          Strings.terms_conditions_desc,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: ColorAll.colorPrimaryDark,
                            fontFamily: 'DMSans_Regular',
                            fontWeight: FontWeight.w400,
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
    );
  }
}
