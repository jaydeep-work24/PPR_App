import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ppr/screens/political_preference.dart';
import 'package:ppr/screens/welcome_screen.dart';

import '../utils/Strings.dart';

BuildContext? ctxOVS;

class OtpVeification extends StatelessWidget {
  OtpVeification(BuildContext ctxOVS1, {Key? key}) : super(key: key) {
    ctxOVS = ctxOVS1;
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = Strings.app_name;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
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
                builder: (ctxProg) => OtpVeificationPage(),
              ),
            ),
          );
        });
  }
}

class OtpVeificationPage extends StatefulWidget {
  const OtpVeificationPage({Key? key}) : super(key: key);

  @override
  OtpVeificationPageState createState() => OtpVeificationPageState();
}

class OtpVeificationPageState extends State<OtpVeificationPage> {
  String currentPin = "";

  @override
  Widget build(BuildContext context) {

    double mainWidth =  MediaQuery.of(context).size.width;

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
                    // Navigator.pop(context);
                    Navigator.of(ctxOVS!).pop();
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
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/app_lock.png',
                  width: 180.w,
                  height: 105.h,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    Strings.otp_Verif,
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
                    Strings.otp_verify_txt,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorAll.colorPrimaryDark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal:mainWidth * 0.04, vertical: 35),
                child: PinCodeTextField(
                  length: 6,
                  appContext: context,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: (mainWidth - (mainWidth * 0.04)*2) * 0.12,
                    fieldWidth: (mainWidth - (mainWidth * 0.04)*2) * 0.12,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: ColorAll.colorAccent,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: ColorAll.textColors,
                    inactiveColor: ColorAll.colorPrimary,
                    activeColor: Colors.white,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: (value) {
                    currentPin = value;
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 180),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: ColorAll.colorPrimaryDark,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      ctxOVS!,
                      MaterialPageRoute(
                        builder: (BuildContext context) => PoliticalPreferencePage(context),
                      ),
                    );
                  },
                  child: Text(
                    Strings.verify_otp,
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
                  Strings.did_nt_recieve,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: (){},
                  child: Text(
                    Strings.resend,
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
