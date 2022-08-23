import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxNS;

class NotificationsPage extends StatelessWidget {
  NotificationsPage(BuildContext ctxNS1, {Key? key}) : super(key: key) {
    ctxNS = ctxNS1;
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
                builder: (ctxProg) => MyNotificationsPage(),
              ),
            ),
          );
        });
  }
}

class MyNotificationsPage extends StatefulWidget {
  const MyNotificationsPage({Key? key}) : super(key: key);

  @override
  MyNotificationsPageState createState() => MyNotificationsPageState();
}

class MyNotificationsPageState extends State<MyNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBar),
        child: Column(
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
                          Navigator.of(ctxNS!).pop();
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
                            Strings.notifications,
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
                padding: EdgeInsets.only(bottom: 10.sp),
                height: mainHeight * 0.70.sp,
                child: ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: mainWidth * 0.15.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0.sp),
                        ),
                        color: ColorAll.uploadbutton,
                      ),
                      width: mainWidth,
                      margin: EdgeInsets.only(
                        left: 20.sp,
                        right: 20.sp,
                        top: 10.sp,
                        bottom: 10.sp,
                      ),
                      padding: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 10.sp,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // selctedIndex = index;
                            print(index);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 52.sp,
                              width: 52.sp,
                              padding: EdgeInsets.only(
                                left: 4.sp,
                              ),
                              child: Image.asset(
                                'assets/images/bellCircle.png',
                                height: 40.sp,
                                width: 40.sp,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      "This is a dummy notification text for understanding purpose.",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp,top: 5.sp),
                                    child: Text(
                                      "15 mins ago",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorAll.colorSeatNo,
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
            ),
          ],
        ),
      ),
    );
  }
}
