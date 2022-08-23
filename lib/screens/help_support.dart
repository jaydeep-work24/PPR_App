import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/home_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxHSS;

class HelpAndSuppotPage extends StatelessWidget {
  HelpAndSuppotPage(BuildContext ctxHSS1, {Key? key}) : super(key: key) {
    ctxHSS = ctxHSS1;
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
                builder: (ctxProg) => MyHelpAndSuppotPage(),
              ),
            ),
          );
        });
  }
}

class MyHelpAndSuppotPage extends StatefulWidget {
  const MyHelpAndSuppotPage({Key? key}) : super(key: key);

  @override
  MyHelpAndSuppotPageState createState() => MyHelpAndSuppotPageState();
}

class MyHelpAndSuppotPageState extends State<MyHelpAndSuppotPage> {
  TextEditingController controllConcernDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      // extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: statusBar),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                                Navigator.of(ctxHSS!).pop();
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
                                  Strings.help_support,
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
                      height: mainHeight * 0.80.sp,
                      padding: EdgeInsets.only(
                          left: 20.sp, top: 10.sp, right: 20.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.sp),
                              child: Text(
                                "We are here to help you!",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: ColorAll.colorPrimaryDark,
                                  fontFamily: 'DMSans_Regular',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: Text(
                                "Hey there! May we help you with any specific issue on PPR? Please reach us with your concern message.",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorAll.colorPrimaryDark,
                                  fontFamily: 'DMSans_Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                Strings.issue,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: ColorAll.textColors,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: mainWidth,
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 8.sp,
                                bottom: 8.sp,
                              ),
                              padding: EdgeInsets.only(
                                left: 8.sp,
                                // right: 8.sp,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: ColorAll.colorItemBg,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Select ${Strings.issue}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'DMSans_Regular',
                                        fontWeight: FontWeight.w400,
                                        color: ColorAll.textColors,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Image.asset(
                                        'assets/images/down_arrow.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Concern Description",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'DMSans_Regular',
                                  fontWeight: FontWeight.w400,
                                  color: ColorAll.textColors,
                                ),
                              ),
                            ),
                            Container(
                              width: mainWidth,
                              // height: 40,
                              margin: EdgeInsets.only(
                                top: 8.sp,
                                bottom: 8.sp,
                              ),
                              padding: EdgeInsets.only(
                                left: 8.sp,
                                // right: 8.sp,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: ColorAll.colorItemBg,
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: controllConcernDesc,
                                // textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans_Regular',
                                ),
                                cursorColor: ColorAll.colorPrimaryDark,
                                autofocus: false,
                                maxLines: 4,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Write from here...",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 0.sp,
                                    bottom: 10.sp,
                                  ),
                                  hintStyle: TextStyle(
                                    color: ColorAll.textColors,
                                    fontSize: 15.sp,
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
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 10.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
              padding: EdgeInsets.only(
                  top: 10.sp, bottom: 10.sp, left: 20.sp, right: 20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.sp),
                ),
                color: ColorAll.colorPrimaryDark,
                // color: ColorAll.colorAccent,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    ctxHSS!,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(context),
                    ),
                  );
                },
                child: Text(
                  Strings.send_msg,
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
}
