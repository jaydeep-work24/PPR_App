import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/marketing_template.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxCDS;

class CandidateDetailsPage extends StatelessWidget {
  CandidateDetailsPage(BuildContext ctxCDS1, {Key? key}) : super(key: key) {
    ctxCDS = ctxCDS1;
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
                builder: (ctxProg) => MyCandidateDetailsPage(),
              ),
            ),
          );
        });
  }
}

class MyCandidateDetailsPage extends StatefulWidget {
  const MyCandidateDetailsPage({Key? key}) : super(key: key);

  @override
  MyCandidateDetailsPageState createState() => MyCandidateDetailsPageState();
}

class MyCandidateDetailsPageState extends State<MyCandidateDetailsPage>
    with TickerProviderStateMixin {
  var cityGroupValue;
  bool isDropDownVisible = false;
  bool isSaerchBoxShow = false;
  TextEditingController controllSearch = TextEditingController();

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
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Navigator.of(ctxCDS!).pop();
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
                                Strings.candidate_details,
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
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      padding: EdgeInsets.only(left: 10.sp),
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Image.asset(
                          'assets/images/share.png',
                          color: Colors.white,
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: mainWidth,
                    child: Image.asset(
                      'assets/images/candidate_detail_back.png',
                    ),
                  ),
                  Container(
                    height: 100.sp,
                    width: mainWidth,
                    color: Colors.transparent,
                    padding: EdgeInsets.only(bottom: mainHeight * 0.02.sp),
                    margin: EdgeInsets.only(
                      top: mainHeight * 0.16.sp,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.sp),
                          child: Image.asset(
                            'assets/images/candidate_detail.png',
                            height: 100.sp,
                            width: 100.sp,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15.sp),
                                child: Text(
                                  "Harsh Sanghvi",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontFamily: 'DMSans_Regular',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 10.sp,top:2.sp),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/menu_icon.png',
                                      height: 24.sp,
                                      width: 24.sp,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Bharatiya Janta Party",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontFamily: 'DMSans_Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
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
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                width: mainWidth,
                color: ColorAll.uploadbutton,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Expanded(
                    child: Text(
                      Strings.social_media_handles,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontFamily: 'DMSans_Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.sp),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20.sp),
                      child: Image.asset(
                        'assets/images/fb.png',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.sp),
                      child: Image.asset(
                        'assets/images/insta.png',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.sp),
                      child: Image.asset(
                        'assets/images/twitter.png',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.sp),
                      child: Image.asset(
                        'assets/images/koo.png',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                width: mainWidth,
                color: ColorAll.uploadbutton,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Expanded(
                    child: Text(
                      Strings.personal_details,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontFamily: 'DMSans_Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 10.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Strings.dob,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans_Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Text(
                                "Feb 13, 1987",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                      margin: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 10.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Strings.education,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans_Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Text(
                                "M.A.(Political Science), \nM.Phill",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                width: mainWidth,
                color: ColorAll.uploadbutton,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Expanded(
                    child: Text(
                      Strings.personal_details,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontFamily: 'DMSans_Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 10.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Strings.election_type,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans_Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Text(
                                "Loksabha",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                      padding: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 10.sp,
                      ),
                      width: mainWidth,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10.sp),
                              child: Text(
                                "Present Status",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSans_Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "MLA (Active-Vejalpur, Ahmedabad)\nMP (Former-Mumbai, Maharashtra)\nMP (Former-Nashik, Maharashtra)",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans_Regular',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.sp, bottom: 10.sp, left: 20.sp, right: 20.sp),
                width: mainWidth,
                color: ColorAll.uploadbutton,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(
                        ctxCDS!,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MarketingTemplatesPage(context),
                        ),
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/template.png',
                          height: 32.sp,
                          width: 24.sp,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20.sp),
                          child: Text(
                            Strings.make_own_template,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/right.png',
                        height: 12.sp,
                        width: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.sp, bottom: 10.sp, left: 20.sp, right: 20.sp),
                width: mainWidth,
                margin: EdgeInsets.only(
                  top: 15.sp,
                  bottom: 15.sp,
                ),
                color: ColorAll.uploadbutton,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showRatingDialog(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/rate.png',
                          height: 32.sp,
                          width: 32.sp,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.sp),
                          child: Text(
                            Strings.rate_candidate,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/right.png',
                        height: 12.sp,
                        width: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var selCat = 0;

  showRatingDialog(BuildContext ctx) {
    print("rating");

    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Container(
            color: ColorAll.colorTransp,
            padding: EdgeInsets.only(
              top: mainWidth * 1.18.sp,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: mainWidth,
                  margin: EdgeInsets.only(
                    top: 50.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                    ),
                    color: Colors.white, //ColorAll.colorItemBg,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30.sp,
                    width: 30.sp,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/close_dialog.png",
                          width: 30.sp,
                          height: 30.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mainWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: mainWidth,
                        margin: EdgeInsets.only(
                          left: 20.sp,
                          right: 20.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                Strings.rate_candidate,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.sp,bottom: 10.sp,),
                              child: RatingBar.builder(
                                initialRating: 3.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.sp,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   ctxPDS!,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         HomePage(context),
                                //   ),
                                // );
                              },
                              child: Container(
                                width: mainWidth,
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.sp)),
                                  color: ColorAll.colorPrimaryDark,
                                ),
                                child: Text(
                                  Strings.submit,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
