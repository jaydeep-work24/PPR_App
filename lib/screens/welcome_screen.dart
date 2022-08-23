import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/signin_screen.dart';

import '../utils/Strings.dart';
import '../utils/Utils.dart';

BuildContext? ctxWS;

class WelcomePage extends StatelessWidget {
  WelcomePage(BuildContext ctxWS1, {Key? key}) : super(key: key) {
    ctxWS = ctxWS1;
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
                builder: (ctxProg) => const MyWelcomePage(),
              ),
            ),
          );
        });
  }
}

class MyWelcomePage extends StatefulWidget {
  const MyWelcomePage({Key? key}) : super(key: key);

  @override
  MyWelcomePageState createState() => MyWelcomePageState();
}

class MyWelcomePageState extends State<MyWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                child: Image.asset(
                  fit: BoxFit.fill,
                  'assets/images/welcome_img.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  Strings.welcome_title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 10),
                child: Text(
                  Strings.welcome_desc,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorAll.colorPrimaryDark,
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      ctxWS!,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SigninPage(context),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/next_btn.png",
                    height: 60,
                    width: 60,
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

class ColorAll {
  static const Color colorPrimary = Color(0xFF3E4095);
  static const Color colorPrimaryDark = Color(0xFF000000);
  static const Color colorIndicator = Color(0xFF222222);
  static const Color textColors = Color(0xFF8B8B8B);
  static const Color tabTextColors = Color(0xFFB3B3B3);
  static const Color tabBackColors = Color(0xFFF6F6F6);
  static const Color colorAccent = Color(0xFFD5B36B);
  static const Color colorAccentDark = Color(0xFFFCF0D7);
  static const Color uploadbutton = Color(0xFFFFFBF3);
  static const Color colorButton = Color(0xFF676767);
  static const Color colorPreference = Color(0xFFFFF7E8);
  static const Color colorBgHome = Color(0xEEEEEEEE);
  static const Color colorItemBg = Color(0xFFD2D2D2);
  static const Color colorSeatNo = Color(0xFFAFAFAF);
  static const Color colorTransp = Color(0x00000000);
  static const Color colorWhite = Color(0x00FFFFFF);
}
