import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';

import '../utils/Strings.dart';

BuildContext? ctxPRS;

class PollResultPage extends StatelessWidget {
  PollResultPage(BuildContext ctxPRS1, {Key? key}) : super(key: key) {
    ctxPRS = ctxPRS1;
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
                builder: (ctxProg) => MyPollResult(),
              ),
            ),
          );
        });
  }
}

class MyPollResult extends StatefulWidget {
  const MyPollResult({Key? key}) : super(key: key);

  @override
  MyPollResultState createState() => MyPollResultState();
}

class MyPollResultState extends State<MyPollResult> {
  bool isChecked = false;
  int selctedIndex = -1;

  @override
  void initState() {
    super.initState();
    isChecked = true;
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
        padding: EdgeInsets.only(top: statusBar),
        child: Column(
          children: <Widget>[
            Container(
              color: ColorAll.colorAccent,
              height: mainWidth * 0.20,
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(ctxPRS!).pop();
                          },
                          child: Image.asset(
                            'assets/images/ic_back.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.sp),
                            child: Text(
                              "${Strings.polls.toUpperCase()} #1 - Result",
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10.sp, left: 20.sp, right: 20.sp, bottom: 10.sp),
              // margin: EdgeInsets.only(bottom: 10.sp),
              width: mainWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who should be the next AMC Corporator from Satellite-Ward 42, Ahmedabad?",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontFamily: 'DMSans_Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Feb 13, 2022",
                      maxLines: 1,
                      style: TextStyle(
                        color: ColorAll.textColors,
                        fontSize: 12.sp,
                        fontFamily: 'DMSans_Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.sp),
                    // height: mainHeight * 0.50.sp,
                    child: ListView.builder(
                      shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          height: mainWidth * 0.15.sp,
                          decoration: selctedIndex == index
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80.0.sp),
                                  ),
                                  color: selctedIndex == index
                                      ? Colors.transparent
                                      : ColorAll.colorPreference,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2.sp,
                                  ),
                                )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80.0.sp),
                                  ),
                                  color: selctedIndex == index
                                      ? Colors.transparent
                                      : ColorAll.colorPreference,
                                ),
                          width: mainWidth,
                          margin: EdgeInsets.only(
                            left: 0.sp,
                            right: 0.sp,
                            top: 10.sp,
                            bottom: 10.sp,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selctedIndex = index;
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
                                    'assets/images/person.png',
                                    height: 50.sp,
                                    width: 50.sp,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      "Sudhanshu Rana",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 4.sp,
                                    right: 10.sp,
                                    left: 4.sp,
                                  ),
                                  child: Text(
                                    '100%',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontFamily: 'DMSans_Regular',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: selctedIndex == index,
                                  child: Container(
                                    height: 32.sp,
                                    width: 32.sp,
                                    margin: EdgeInsets.only(
                                      top: 4.sp,
                                      right: 10.sp,
                                      left: 4.sp,
                                    ),
                                    child: Image.asset(
                                      'assets/images/check_polls.png',
                                      color: Colors.green,
                                      height: 30.sp,
                                      width: 30.sp,
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
          ],
        ),
      ),
    );
  }
}
