import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/model/PPreferenceModel.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Utils.dart';

import '../utils/Strings.dart';
import 'home_screen.dart';

BuildContext? ctxPPS;

class PoliticalPreferencePage extends StatelessWidget {
  PoliticalPreferencePage(BuildContext ctxPPS1, {Key? key}) : super(key: key) {
    ctxPPS = ctxPPS1;
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
                builder: (ctxProg) => MyPoliticalPreferencePage(),
              ),
            ),
          );
        });
  }
}

class MyPoliticalPreferencePage extends StatefulWidget {
  const MyPoliticalPreferencePage({Key? key}) : super(key: key);

  @override
  MyPoliticalPreferencePageState createState() =>
      MyPoliticalPreferencePageState();
}

class MyPoliticalPreferencePageState extends State<MyPoliticalPreferencePage> {
  TextEditingController controllPhoneNumber = TextEditingController();
  var _groupValue;
  // List<PPreferenceModel> preferenceList = [];

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 72.sp, left: 20.sp, right: 20.sp),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(ctxPPS!).pop();
                },
                child: FadeInImage.assetNetwork(placeholder: "", image: ""),
                /*child: Image.asset(
                  'assets/images/close_btn.png',
                  height: 32,
                  width: 32,
                ),*/
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  Strings.your_political_preference,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  Strings.select_political_preference,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorAll.colorPrimaryDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              height: mainHeight * 0.60,
              width: mainWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.sp),
                ),
                color: Colors.white,
              ),
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
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.transparent,
                      // width: mainWidth * 0.40,
                      // height: 500,
                      child: InkWell(
                        onTap: () {
                          print("=====>" + index.toString());
                          setState(() {
                            _groupValue = index.toString();
                          });
                        },
                        child: Card(
                          elevation: 10.sp,
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                          // semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                          ),
                          child: Column(
                            children: [
                              Stack(alignment: Alignment.topRight, children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: FadeInImage.assetNetwork(placeholder: "", image: ""),
                                  /*child: Image.asset(
                                    'assets/images/img_preferenceb.jpg',
                                  ),*/
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Radio(
                                    value: index.toString(),
                                    activeColor: ColorAll.colorAccent,
                                    groupValue: _groupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _groupValue = value!;
                                      });
                                      print("value==>" + value.toString());
                                    },
                                  ),
                                )
                              ]),
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    Strings.preference_title,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
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
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                color: ColorAll.colorPrimaryDark,
              ),
              child: InkWell(
                onTap: () {
                  if (_groupValue != null) {
                    Navigator.push(
                      ctxPPS!,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(context),
                      ),
                      // (route) => false,
                    );
                  }else{
                    Util.showToast("Please Checked");
                  }
                },
                child: Text(
                  Strings.lets_start,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
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
