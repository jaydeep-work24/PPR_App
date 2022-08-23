import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxMMTS;

class MarketingTemplatePage extends StatelessWidget {
  MarketingTemplatePage(BuildContext ctxMMTS1, {Key? key}) : super(key: key) {
    ctxMMTS = ctxMMTS1;
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
                builder: (ctxProg) => MyMarketingTemplatePage(),
              ),
            ),
          );
        });
  }
}

class MyMarketingTemplatePage extends StatefulWidget {
  const MyMarketingTemplatePage({Key? key}) : super(key: key);

  @override
  MyMarketingTemplatePageState createState() => MyMarketingTemplatePageState();
}

class MyMarketingTemplatePageState extends State<MyMarketingTemplatePage>
    with TickerProviderStateMixin {
  // bool loading = false;
  double value = 0;

  @override
  void initState() {
    super.initState();
    // determinateIndicator();
  }

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
                height: mainHeight * 0.10,
                padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(ctxMMTS!).pop();
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
                                Strings.my_marketing_template,
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
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    Container(
                      height: (mainHeight - (mainHeight * 0.10)) * 0.80,
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/m_template.png',
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              child: Text(
                                "You can download or directly share this custom Template to your social media from below.",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans_Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: mainWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: mainWidth * 0.35.sp,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.sp)),
                              color: ColorAll.colorPrimaryDark,
                            ),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/share.png',
                                    color: ColorAll.colorAccent,
                                    height: 24.sp,
                                    width: 24.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.share,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                          color: ColorAll.colorAccent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: mainWidth * 0.35.sp,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.sp)),
                              color: ColorAll.colorPrimaryDark,
                            ),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/download.png',
                                    height: 24.sp,
                                    width: 24.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Text(
                                      Strings.download,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                          color: ColorAll.colorAccent),
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
            ],
          ),
        ),
      ),
    );
  }
}
