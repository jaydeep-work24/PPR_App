import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Utils.dart';

import '../utils/Strings.dart';
import 'home_screen.dart';

BuildContext? ctxPDS;

class PollDetailPage extends StatelessWidget {
  PollDetailPage(BuildContext ctxPDS1, {Key? key}) : super(key: key) {
    ctxPDS = ctxPDS1;
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
                builder: (ctxProg) => MyPollDetail(),
              ),
            ),
          );
        });
  }
}

class MyPollDetail extends StatefulWidget {
  const MyPollDetail({Key? key}) : super(key: key);

  @override
  MyPollDetailState createState() => MyPollDetailState();
}

class MyPollDetailState extends State<MyPollDetail> {
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
                            Navigator.of(ctxPDS!).pop();
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
                              "${Strings.polls.toUpperCase()} #1",
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
                  top: 20.sp, left: 20.sp, right: 20.sp, bottom: 10.sp),
              // margin: EdgeInsets.only(bottom: 10.sp),
              width: mainWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who should be the next AMC Corporator from Satellite-Ward 42, Ahmedabad?",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontFamily: 'DMSans_Regular',
                      fontWeight: FontWeight.w500,
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
                    margin: EdgeInsets.only(top: 20.sp),
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
                    padding: EdgeInsets.only(bottom: 10.sp),
                    height: mainHeight * 0.50.sp,
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
                                    color: ColorAll.colorAccent,
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
            Container(
              width: mainWidth,
              margin: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, top: 0.sp, bottom: 10.sp),
              padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.sp)),
                color: ColorAll.colorPrimaryDark,
              ),
              child: InkWell(
                onTap: () {
                  if (selctedIndex != -1) {
                    showThanksDialog(context);
                  } else {
                    Util.showToast("Please select");
                  }
                },
                child: Text(
                  Strings.submit_vote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontFamily: 'DMSans_Regular',
                      color: ColorAll.colorAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showThanksDialog(BuildContext ctx) {
    print("thanks");
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Container(
            color: ColorAll.colorTransp,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.98.sp,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 50.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                    ),
                    color: Colors.white, //ColorAll.colorItemBg,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30.sp,
                    width: 30.sp,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/close_dialog.png",
                          width: 30.sp,
                          height: 30.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          left: 20.sp,
                          right: 20.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Image.asset(
                                "assets/images/thanks.png",
                                width: 80.sp,
                                height: 80.sp,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                Strings.thanks_vote,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.sp,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam adipiscing pellentesque tincidunt in iaculis velit imperdiet porttitor. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  ctxPDS!,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomePage(context),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.sp)),
                                  color: ColorAll.colorPrimaryDark,
                                ),
                                child: Text(
                                  Strings.go_home,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      color: ColorAll.colorAccent),
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
          ),
        );
      },
    );
  }
}
