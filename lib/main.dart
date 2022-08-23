import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/home_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/MySharedPreferences.dart';
import 'package:ppr/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashPage(title: 'PPR'),
          );
        });
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  SplashScreen createState() => SplashScreen();
}

class SplashScreen extends State<SplashPage> with TickerProviderStateMixin {
  SharedPreferences? myPrefs;

  @override
  void initState() {
    Timer(
      Duration(milliseconds: 2000), //2000
      () => nextPage(),
    );
  }

  nextPage() async {
    myPrefs = await SharedPreferences.getInstance();

    String? isLogin = MySharedPreferences.instance
        .getStringValue(Util.IS_LOGIN, "false", myPrefs!);

    Navigator.pop(context);
    if (isLogin == "true") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(context),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => WelcomePage(context),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/background_top.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              /*Center(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  // color: ColorAll.colorPrimaryDark,
                ),
              ),*/
              AnimatedContainer(
                duration: const Duration(seconds: 3),
                alignment: Alignment.center,
                onEnd: () {
                  setState(() {
                    nextPage();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/background_top.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100.sp),
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                        width: 260.sp,
                        height: 150.sp,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/background_bottom.png',
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
