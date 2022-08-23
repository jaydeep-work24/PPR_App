import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:ppr/model/SignUpReqModel.dart';
import 'package:ppr/screens/otp_verification.dart';

import '../../model/SignUpModel.dart';
import '../../model/SignUpReqModel.dart';
import '../../utils/Strings.dart';
import '../../utils/Utils.dart';
import '../../utils/app_constants.dart';
import '../signin_screen.dart';
import '../welcome_screen.dart';

BuildContext? ctxSUSM;
SignUpReqModel? signUpReqModelSoc;

class SignUpSocialmedia extends StatelessWidget {
  SignUpSocialmedia(BuildContext ctxSUSM1, SignUpReqModel signUpReqModelSoc1,
      {Key? key})
      : super(key: key) {
    ctxSUSM = ctxSUSM1;
    signUpReqModelSoc = signUpReqModelSoc1;
    var nm = signUpReqModelSoc?.name ?? "";
    print("nmneeeeeer=-=-=->$nm");
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
                builder: (ctxProg) => MySignUpSocialmediaPage(),
              ),
            ),
          );
        });
  }
}

class MySignUpSocialmediaPage extends StatefulWidget {
  const MySignUpSocialmediaPage({Key? key}) : super(key: key);

  @override
  MySignUpSocialmediaPageState createState() => MySignUpSocialmediaPageState();
}

class MySignUpSocialmediaPageState extends State<MySignUpSocialmediaPage> {
  TextEditingController controllfb = TextEditingController();
  TextEditingController controllinsta = TextEditingController();
  TextEditingController controlltwitter = TextEditingController();
  TextEditingController controllkoo = TextEditingController();

  _lostFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  getSignUpCall() async {
    var progress;
    Timer(const Duration(milliseconds: 20), () {
      progress = ProgressHUD.of(ctxProgressLP);
      progress.show();

      Timer(const Duration(seconds: 15), () {
        progress.dismiss();
      });
    });

    var nm = signUpReqModelSoc?.name ?? "";
    print("nmneeeeeer=-=-=->$nm");
    http.Response response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.SIGNUP_URI),
        body: jsonEncode(<String, String>{
          "Name": signUpReqModelSoc?.name.toString() ?? "",
          "Phone_number": signUpReqModelSoc?.phoneNumber.toString() ?? "",
          "BusinessName": signUpReqModelSoc?.businessName.toString() ?? "",
          "Designation": signUpReqModelSoc?.designation.toString() ?? "",
          "EmailID": signUpReqModelSoc?.emailID.toString() ?? "",
          "Date_of_Birth": signUpReqModelSoc?.dateOfBirth.toString() ?? "",
          "Gender": signUpReqModelSoc?.gender.toString() ?? "",
          "Occupation": signUpReqModelSoc?.occupation.toString() ?? "",
          "ElectionCardNo": signUpReqModelSoc?.electionCardNo.toString() ?? "",
          "Address": signUpReqModelSoc?.address.toString() ?? "",
          "Pincode": signUpReqModelSoc?.pincode.toString() ?? "",
          "City": signUpReqModelSoc?.city.toString() ?? "",
          "Political_Prefrence": "62c81ae73200f17e74ee71e4",
          "State": signUpReqModelSoc?.status.toString() ?? "",
          "Country": signUpReqModelSoc?.country.toString() ?? "",
          "Status": "true",
          "Image": signUpReqModelSoc?.image.toString() ?? "",
          "facebook": controllfb.text.trim().toString(),
          "twitter": controlltwitter.text.trim().toString(),
          "instagram": controllinsta.text.trim().toString(),
          "kho": controllkoo.text.trim().toString(),
        }),
        headers: {
          "Content-Type": "Application/json"
        }); //using JWT token for WP authentication is not needed
    print(response.body);
    progress.dismiss();

    final responseJson = jsonDecode(response.body);
    print("=----->$responseJson");
    SignUpModel signUpModel = SignUpModel.fromJson(responseJson);
    if (signUpModel.response == false) {
      Util.showToast(signUpModel.error.toString());
    } else {
      print("Done==>${signUpModel.response}");
      Util.showToast(Strings.success);

      print("msg==>${signUpModel.message}");
      print("result==>${signUpModel.result!.name}");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 72, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(ctxSUSM!).pop();
                },
                child: Image.asset(
                  'assets/images/close_btn.png',
                  height: 32,
                  width: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  Strings.signup,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  Strings.signup_txt,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.step_3_soci,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorAll.colorPrimaryDark,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(ctxSUSM!).pop();
                            },
                            child: Image.asset(
                              'assets/images/circle_left.png',
                              color: ColorAll.colorAccent,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Image.asset(
                            'assets/images/circle_right.png',
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ]),
              ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: Strings.enter_fb_link,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: Strings.enter_insta_link,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: Strings.enter_twitter_link,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: ColorAll.colorPrimaryDark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: ColorAll.colorPrimaryDark,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: Strings.enter_koo_link,
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  Strings.privacy_policy,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
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
                    Navigator.push(
                      ctxSUSM!,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OtpVeification(context),
                      ),
                    );
                  },
                  child: Text(
                    Strings.get_otp,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: ColorAll.colorAccent),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  Strings.already_ppr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 2),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      ctxSUSM!,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SigninPage(context),
                      ),
                    );
                  },
                  child: Text(
                    Strings.signin,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorAll.colorPrimaryDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
