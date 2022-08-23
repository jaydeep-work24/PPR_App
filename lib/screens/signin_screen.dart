import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:ppr/model/SignUpReqModel.dart';
import 'package:ppr/model/UserModel.dart';
import 'package:ppr/screens/signUpScreens/signup_basic_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/app_constants.dart';

import '../utils/MySharedPreferences.dart';
import '../utils/Strings.dart';
import '../utils/Utils.dart';
import 'home_screen.dart';
import 'otp_verification.dart';

BuildContext? ctxSS;
var ctxProgressLP;

class SigninPage extends StatelessWidget {
  SigninPage(BuildContext ctxSS1, {Key? key}) : super(key: key) {
    ctxSS = ctxSS1;
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
                builder: (ctxProg) => MySigninPage(ctxProg),
              ),
            ),
          );
        });
  }
}

class MySigninPage extends StatefulWidget {
  MySigninPage(BuildContext ctxProg, {Key? key}) : super(key: key) {
    ctxProgressLP = ctxProg;
  }

  @override
  MySigninPageState createState() => MySigninPageState();
}

class MySigninPageState extends State<MySigninPage> {
  TextEditingController controllPhoneNumber = TextEditingController();

  _lostFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  getLoginCall() async {
    var progress;
    Timer(const Duration(milliseconds: 20), () {
      progress = ProgressHUD.of(ctxProgressLP);
      progress.show();

      Timer(const Duration(seconds: 15), () {
        progress.dismiss();
      });
    });

    http.Response response = await http.post(
        Uri.parse(
            AppConstants.BASE_URL + AppConstants.SIGNIN_GET_USER_DATA_URI),
        body: jsonEncode(<String, String>{
          "Phone_number": controllPhoneNumber.text.toString(),
        }),
        // ),
        headers: {
          "Content-Type": "Application/json"
        }); //using JWT token for WP authentication is not needed
    print(response.body);
    progress.dismiss();

    final responseJson = jsonDecode(response.body);
    print("=----->" + responseJson.toString());
    UserModel userModel = UserModel.fromJson(responseJson);
    if (userModel.response == false) {
      Util.showToast(userModel.error.toString());
    } else {
      print("Token==>" + userModel.auth.toString());
      print("Email==>" + userModel.users!.emailID.toString());
      print("userId==>" + userModel.users!.sId.toString());
      print("PhoneNumber==>" + userModel.users!.phoneNumber.toString());
      print("Done==>" + userModel.response.toString());
      Util.showToast(Strings.success);

      MySharedPreferences.instance.setStringValue(Util.IS_LOGIN, "true");

      MySharedPreferences.instance
          .setStringValue(Util.AUTH_TOKEN, userModel.auth.toString());
      MySharedPreferences.instance
          .setStringValue(Util.USERNAME, userModel.users!.name.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_PHONE, userModel.users!.phoneNumber.toString());
      MySharedPreferences.instance
          .setStringValue(Util.EMAIL, userModel.users!.emailID.toString());
      MySharedPreferences.instance
          .setStringValue(Util.DOB, userModel.users!.dateOfBirth.toString());

      MySharedPreferences.instance
          .setStringValue(Util.S_COUNTRY, userModel.users!.country.toString());
      Navigator.push(
        ctxSS!,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              OtpVeification(context),
        ),
      );
    }

    /*if (response.body.toString().contains("invalid_email")) {
      Util.showToast(Strings.msg_email_not_reg);
      progress.dismiss();
    }else if (response.body.toString().contains("too_many_retries")) {
      Util.showToast(Strings.msg_login_attempt_failed);
      progress.dismiss();
    } else {
      final responseJson = jsonDecode(response.body);
      print("=----->" + responseJson.toString());
      SigninModel signinModel = SigninModel.fromJson(responseJson);
      print("Done==>" + signinModel.response.toString());
      Util.showToast(Strings.success);
      // nextPage();
      // getDataByEmail(loginModel.user_email.toString());
      progress.dismiss();
      // final responseJson = json.decode(response.bodyString);
    }*/
  }

  Future getDataByEmail(String email) async {
    var progress;
    Timer(const Duration(milliseconds: 20), () {
      progress = ProgressHUD.of(ctxProgressLP);
      progress.show();

      Timer(const Duration(seconds: 1), () {
        progress.dismiss();
      });
    });

    http.Response response = await http.post(
        Uri.parse(
            AppConstants.BASE_URL + AppConstants.SIGNIN_GET_USER_DATA_URI),
        body: jsonEncode(<String, String>{
          "Phone_number": controllPhoneNumber.text.toString(),
        }),
        headers: {
          "Content-Type": "Application/json"
        }); //using JWT token for WP authentication is not needed
    print(response.body);
    progress.dismiss();
    print("http res==>" + response.body.toString());
    var listCust = json.decode(response.body);
    if ((listCust as List).isNotEmpty) {
      print("data-->" + (listCust)[0].toString());
      UserModel model = UserModel.fromJson((listCust)[0]);
      print("--->" + model.users!.name.toString());
      print("--->" + model.users!.phoneNumber.toString());

      MySharedPreferences.instance.setStringValue(Util.IS_LOGIN, "true");

      MySharedPreferences.instance
          .setStringValue(Util.USERNAME, model.users!.name.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_COMPANY, model.users!.businessName.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_ADDRESS_1, model.users!.address.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_CITY, model.users!.city.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_POSTCODE, model.users!.pincode.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_COUNTRY, model.users!.country.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_STATE, model.users!.state.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_EMAIL, model.users!.emailID.toString());
      MySharedPreferences.instance
          .setStringValue(Util.B_PHONE, model.users!.phoneNumber.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_ADDRESS_1, model.users!.address.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_CITY, model.users!.city.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_POSTCODE, model.users!.pincode.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_COUNTRY, model.users!.country.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_STATE, model.users!.state.toString());
      MySharedPreferences.instance
          .setStringValue(Util.S_PHONE, model.users!.phoneNumber.toString());
      MySharedPreferences.instance
          .setStringValue(Util.AVATAR_URL, model.users!.image.toString());

      nextPage();
    }
  }

  nextPage() {
    // Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            // CategoryPage(context),
            HomePage(context),
        // MyApp1(),
        transitionDuration: Duration(milliseconds: 800),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 72, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(ctxSS!).pop();
                  },
                  child: Image.asset(
                    'assets/images/close_btn.png',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/signin_img.png',
                  width: 180.w,
                  height: 105.h,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    Strings.signin,
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
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    Strings.signin_txt,
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
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    Strings.phone_number,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorAll.textColors,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: ColorAll.colorAccent,
                    width: 1,
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: ColorAll.colorAccent,
                  //     spreadRadius: 0,
                  //     blurRadius: 4,
                  //     offset: Offset(3, 5),
                  //   ),
                  // ],
                ),
                child: TextField(
                  controller: controllPhoneNumber,
                  // textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 10,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    color: ColorAll.colorPrimaryDark,
                    fontSize: 15.sp,
                  ),
                  cursorColor: ColorAll.colorPrimaryDark,
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: Strings.hint_mobile,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 0.sp,
                      bottom: 10.sp,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(Strings.phone_number_code,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorAll.colorAccent, fontSize: 15.sp)),
                    ),
                    counterText: "",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
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
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: ColorAll.colorPrimaryDark,
                ),
                child: InkWell(
                  onTap: () {
                    if (controllPhoneNumber.text.trim().isEmpty) {
                      Util.showToast(Strings.hint_mobile);
                    } else {
                      _lostFocus();
                      getLoginCall();
                    }
                  },
                  child: Text(
                    Strings.get_otp,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                        color: ColorAll.colorAccent),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  Strings.new_on_ppr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      ctxSS!,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUpBasic(context),
                      ),
                    );
                  },
                  child: Text(
                    Strings.signup,
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
