import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/my_marketing_template.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxMTS;

class MarketingTemplatesPage extends StatelessWidget {
  MarketingTemplatesPage(BuildContext ctxMTS1, {Key? key}) : super(key: key) {
    ctxMTS = ctxMTS1;
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
                builder: (ctxProg) => MyMarketingTemplatesPage(),
              ),
            ),
          );
        });
  }
}

class MyMarketingTemplatesPage extends StatefulWidget {
  const MyMarketingTemplatesPage({Key? key}) : super(key: key);

  @override
  MyMarketingTemplatesPageState createState() =>
      MyMarketingTemplatesPageState();
}

class MyMarketingTemplatesPageState extends State<MyMarketingTemplatesPage> {
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
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(ctxMTS!).pop();
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
                                Strings.marketing_templates,
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
                padding:
                    EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
                height: mainHeight * 0.88,
                width: mainWidth,
                // color: Colors.red,
                child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // padding: EdgeInsets.all(20.sp),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.sp,
                      mainAxisSpacing: 15.sp,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print("=====>" + index.toString());
                          setState(() {Navigator.push(
                            ctxMTS!,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MarketingTemplatePage(context),
                            ),
                          );});
                        },
                        child: Container(
                          color: Colors.transparent,
                          // width: mainWidth * 0.40,
                          // height: 500,
                          child: Card(
                            elevation: 0.sp,
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            // semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/template_img.png',
                                ),
                                Expanded(
                                  child: Container(
                                    width: mainWidth,
                                    // height: 60.sp,
                                    decoration: BoxDecoration(
                                      color: ColorAll.colorPreference,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    padding: EdgeInsets.only(left: 10.sp,right: 10.sp,),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Strings.customize,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                              fontFamily: 'DMSans_Regular',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Image.asset(
                                          'assets/images/right.png',
                                          height: 12.sp,
                                          width: 16.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
