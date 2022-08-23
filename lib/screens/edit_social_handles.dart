import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ppr/model/SignUpReqModel.dart';
import 'package:ppr/screens/signUpScreens/signup_address.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxESHS;

class EditSocialHandlesPage extends StatelessWidget {
  EditSocialHandlesPage(BuildContext ctxESHS1, {Key? key}) : super(key: key) {
    ctxESHS = ctxESHS1;
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
                builder: (ctxProg) => MyEditSocialHandlesPage(),
              ),
            ),
          );
        });
  }
}

class MyEditSocialHandlesPage extends StatefulWidget {
  const MyEditSocialHandlesPage({Key? key}) : super(key: key);

  @override
  MyEditSocialHandlesPageState createState() => MyEditSocialHandlesPageState();
}

class MyEditSocialHandlesPageState extends State<MyEditSocialHandlesPage> {
  TextEditingController controllfb = TextEditingController();
  TextEditingController controllinsta = TextEditingController();
  TextEditingController controlltwitter = TextEditingController();
  TextEditingController controllkoo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          Navigator.of(ctxESHS!).pop();
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
                            Strings.edit_social_handles,
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
                padding: EdgeInsets.only(left: 20.sp, top: 10.sp, right: 20.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.facebook,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextField(
                            controller: controllfb,
                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: ColorAll.colorPrimaryDark,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: ColorAll.colorPrimaryDark,
                            autofocus: false,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              hintText: "Update ${Strings.facebook} Link",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 0.sp,
                                bottom: 10.sp,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/fb.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: ColorAll.textColors,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.instagram,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextField(
                            controller: controllinsta,
                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: ColorAll.colorPrimaryDark,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: ColorAll.colorPrimaryDark,
                            autofocus: false,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              hintText: "Update ${Strings.instagram} Link",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 0.sp,
                                bottom: 10.sp,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/insta.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: ColorAll.textColors,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.twitter,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextField(
                            controller: controlltwitter,
                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: ColorAll.colorPrimaryDark,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: ColorAll.colorPrimaryDark,
                            autofocus: false,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              hintText: "Update " + Strings.twitter + " Link",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 0.sp,
                                bottom: 10.sp,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/twitter.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: ColorAll.textColors,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.koo,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextField(
                            controller: controllkoo,
                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              color: ColorAll.colorPrimaryDark,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: ColorAll.colorPrimaryDark,
                            autofocus: false,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              hintText: "Update ${Strings.koo} link",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 0.sp,
                                bottom: 10.sp,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/koo.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: ColorAll.textColors,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: mainWidth,
              margin: EdgeInsets.only(
                  top: 10.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
              padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.sp),),
                color: ColorAll.colorPrimaryDark,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    ctxESHS!,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignUpAddress(context,SignUpReqModel()),
                    ),
                  );
                },
                child: Text(
                  Strings.update,
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
    );
  }

}
