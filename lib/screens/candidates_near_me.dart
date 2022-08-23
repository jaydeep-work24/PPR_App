import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppr/screens/candidate_details.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxCNMS;

class CandidateNearMePage extends StatelessWidget {
  CandidateNearMePage(BuildContext ctxCNMS1, {Key? key}) : super(key: key) {
    ctxCNMS = ctxCNMS1;
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
                builder: (ctxProg) => MyCandidateNearMePage(),
              ),
            ),
          );
        });
  }
}

class MyCandidateNearMePage extends StatefulWidget {
  const MyCandidateNearMePage({Key? key}) : super(key: key);

  @override
  MyCandidateNearMePageState createState() => MyCandidateNearMePageState();
}

class MyCandidateNearMePageState extends State<MyCandidateNearMePage>
    with TickerProviderStateMixin {
  var _groupValue;
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
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                visible: !isSaerchBoxShow,
                child: Container(
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
                                Navigator.of(ctxCNMS!).pop();
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
                                  Strings.candidates_near_me,
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
                            setState(() {
                              isDropDownVisible = false;
                              if (isSaerchBoxShow) {
                                isSaerchBoxShow = false;
                              } else {
                                isSaerchBoxShow = true;
                              }
                            });
                          },
                          child: Image.asset(
                            'assets/images/ic_search.png',
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      ),
                      Container(
                        height: 30.sp,
                        width: 30.sp,
                        padding: EdgeInsets.only(left: 10.sp),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isDropDownVisible = false;
                              showFilter(context);
                            });
                          },
                          child: Image.asset(
                            'assets/images/filter.png',
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isSaerchBoxShow,
                child: Container(
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
                                // Navigator.of(ctxCNMS!).pop();
                              },
                              child: Image.asset(
                                'assets/images/ic_search.png',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: mainWidth,
                                height: 40,
                                margin: EdgeInsets.only(
                                  bottom: 8.sp,
                                ),
                                padding: EdgeInsets.only(
                                  left: 10.sp,
                                  // right: 8.sp,
                                ),
                                color: ColorAll.colorAccent,
                                child: TextField(
                                  controller: controllSearch,
                                  // textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  textInputAction: TextInputAction.search,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: 'DMSans_Regular',
                                  ),
                                  cursorColor: ColorAll.colorItemBg,
                                  autofocus: false,
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: Strings.search_nm,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      left: 0.sp,
                                      bottom: 10.sp,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'DMSans_Regular',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
                            setState(() {
                              isSaerchBoxShow = false;
                            });
                          },
                          child: Image.asset(
                            'assets/images/close_search.png',
                            color: Colors.white,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: mainHeight * 0.10,),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                          height: mainHeight - ((mainHeight * 0.10.sp) * 2.sp + 0.sp),
                          width: mainWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.sp,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.only(bottom: 20.sp),
                                // margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
                                child: InkWell(
                                  onTap: () {
                                    print("=====>$index");
                                    setState(() {
                                      Navigator.push(
                                        ctxCNMS!,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CandidateDetailsPage(context),
                                        ),
                                      );
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/candidate_img.png',
                                        height: mainWidth * 0.40.sp,
                                        width: mainWidth * 0.30.sp,
                                      ),
                                      Expanded(
                                        // flex: 1,
                                        child: Container(
                                          height: mainWidth * 0.40.sp,
                                          width: mainWidth * 0.70.sp,
                                          padding: EdgeInsets.only(
                                            left: 10.sp,
                                            right: 10.sp,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0.sp),
                                              bottomRight: Radius.circular(10.0.sp),
                                            ),
                                            color: ColorAll.colorPreference,
                                          ),
                                          // padding: EdgeInsets.only(
                                          //   top: 5.sp,
                                          //   bottom: 5.sp,
                                          // ),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Harsh Sanghvi",
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: ColorAll.colorPrimaryDark,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'DMSans_Regular',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "MA (Active)",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorAll.textColors,
                                                    fontSize: 12.sp,
                                                    fontFamily: 'DMSans_Regular',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 5),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/mappin.png',
                                                      height: 16.sp,
                                                      width: 16.sp,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(left: 5.sp),
                                                      child: Text(
                                                        "Satellite, Ahmedabad",
                                                        maxLines: 1,
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          color: ColorAll.textColors,
                                                          fontSize: 12.sp,
                                                          fontFamily:
                                                          'DMSans_Regular',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                color: ColorAll.colorAccentDark,
                                                margin: EdgeInsets.only(
                                                  top: 15.sp,
                                                ),
                                                height: 1.sp,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 10.sp),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Social Popularity",
                                                        maxLines: 1,
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          color: ColorAll
                                                              .colorPrimaryDark,
                                                          fontSize: 10.sp,
                                                          fontFamily:
                                                          'DMSans_Regular',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 10.sp),
                                                      child: Text(
                                                        "75%",
                                                        maxLines: 1,
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          color: ColorAll
                                                              .colorPrimaryDark,
                                                          fontSize: 10.sp,
                                                          fontFamily:
                                                          'DMSans_Regular',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        left: 6.sp,
                                                        right: 6.sp,
                                                        top: 2.sp,
                                                        bottom: 2.sp,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(6.sp),
                                                        ),
                                                        color: ColorAll.colorAccent,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "4.5",
                                                            maxLines: 1,
                                                            textAlign:
                                                            TextAlign.start,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                              'DMSans_Regular',
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                          ),
                                                          Image.asset(
                                                            'assets/images/ratingstar.png',
                                                            height: 10.sp,
                                                            width: 10.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10.sp),
                                                child: LinearProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                  color: ColorAll.colorPrimaryDark,
                                                  value: 0.60,
                                                  minHeight: 4.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: isDropDownVisible,
                          child: InkWell(
                            onTap: () {
                              // setState(() {
                              //   isDropDownVisible = false;
                              // });
                            },
                            child: Container(
                              color: Colors.black38,
                              height:
                              mainHeight - ((mainHeight * 0.10.sp) * 2.sp + 0.sp),
                              child: Column(
                                children: [
                                  Container(
                                    height: mainHeight * 0.30.sp,
                                    // margin: EdgeInsets.only(bottom: mainHeight * 0.40.sp),
                                    padding:
                                    EdgeInsets.only(left: 20.sp, right: 20.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.sp),
                                        bottomRight: Radius.circular(16.sp),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      // scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              _groupValue = index.toString();
                                              isDropDownVisible = false;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: 10.sp,
                                                  bottom: 10.sp,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Radio(
                                                      value: index.toString(),
                                                      activeColor:
                                                      ColorAll.colorAccent,
                                                      groupValue: _groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _groupValue = value!;
                                                          isDropDownVisible = false;
                                                        });
                                                        print("value==>" +
                                                            value.toString());
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "MP",
                                                            style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontFamily:
                                                              'DMSans_Regular',
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            "(Member of Parliament)",
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontFamily:
                                                              'DMSans_Regular',
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      "105",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'DMSans_Regular',
                                                        color: ColorAll.colorSeatNo,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                color: ColorAll.colorBgHome,
                                                margin: EdgeInsets.only(
                                                  top: 10.sp,
                                                ),
                                                height: 1.sp,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.sp),
                                    height: 30.sp,
                                    width: 30.sp,
                                    child: InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isDropDownVisible = false;
                                          });
                                        },
                                        child: Image.asset(
                                          "assets/images/close_dialog.png",
                                          width: 30.sp,
                                          height: 30.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    color: ColorAll.tabBackColors,
                    height: mainHeight * 0.10,
                    padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isDropDownVisible) {
                            isDropDownVisible = false;
                          } else {
                            isDropDownVisible = true;
                          }
                        });
                      },
                      child: Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/usersthree.png',
                                height: 32.sp,
                                width: 32.sp,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    Visibility(
                                      visible: _groupValue == null,
                                      child: Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 20.sp,
                                          ),
                                          child: Text(
                                            Strings.select_cadidates_type,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'DMSans_Regular',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: _groupValue != null,
                                      child: Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.sp, top: 20.sp),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "MP",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'DMSans_Regular',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "(Member of Parliament)",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'DMSans_Regular',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
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
                          height: 30.sp,
                          width: 30.sp,
                          child: isDropDownVisible == false
                              ? Image.asset(
                            'assets/images/down_arrow.png',
                            height: 24.sp,
                            width: 24.sp,
                          )
                              : Image.asset(
                            'assets/images/up_arrow.png',
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Visibility(
                    visible: isSaerchBoxShow,
                    child: InkWell(
                      onTap: () {
                        // setState(() {
                        //   isDropDownVisible = false;
                        // });
                      },
                      child: Container(
                        color: Colors.black38,
                        height:
                        mainHeight - (mainHeight * 0.10.sp),
                        child: Column(
                          children: [
                            Container(
                              height: mainHeight * 0.30.sp,
                              // margin: EdgeInsets.only(bottom: mainHeight * 0.40.sp),
                              padding:
                              EdgeInsets.only(left: 54.sp, right: 20.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.sp),
                                  bottomRight: Radius.circular(16.sp),
                                ),
                                color: Colors.white,
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                // scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSaerchBoxShow = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 10.sp,
                                        bottom: 10.sp,
                                      ),
                                      child: Expanded(
                                        child: Text(
                                          "MP",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'DMSans_Regular',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  var selCat = 0;
  var catList = [Strings.state, Strings.district, Strings.constinuency];

  showFilter(BuildContext ctx) {
    print("filter");

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
              top: mainWidth * 0.98.sp,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
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
                Container(
                  height: 30.sp,
                  width: 30.sp,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Image.asset(
                      "assets/images/close_dialog.png",
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: mainWidth * 0.12.sp,
                          // left: 20.sp,
                          // right: 20.sp,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                Strings.filter,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10.sp),
                                    width: (mainWidth * 0.35) - 5.sp,
                                    color: Colors.yellow,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        // scrollDirection: Axis.horizontal,
                                        itemCount: catList.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selCat = index;
                                              });
                                            },
                                            child: Container(
                                              height: 40.sp,
                                              color: selCat == index
                                                  ? Colors.white
                                                  : ColorAll.colorBgHome,
                                              padding: EdgeInsets.only(
                                                left: 20.sp,
                                              ),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  catList[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        'DMSans_Regular',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        })),
                                Container(
                                  width: (mainWidth * 0.65) - 5.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // height: mainHeight * 0.30.sp,
                                        // margin: EdgeInsets.only(bottom: mainHeight * 0.40.sp),
                                        padding: EdgeInsets.only(
                                            left: 20.sp, right: 20.sp),
                                        color: Colors.white,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          // scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _groupValue =
                                                      index.toString();
                                                });
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Radio(
                                                      value: index.toString(),
                                                      activeColor:
                                                          ColorAll.colorAccent,
                                                      groupValue: _groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _groupValue = value!;
                                                        });
                                                        print("value==>" +
                                                            value.toString());
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "Ahmedabad",
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'DMSans_Regular',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "105",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'DMSans_Regular',
                                                        color: ColorAll
                                                            .colorSeatNo,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20.sp,right: 20.sp,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/reset.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Text(
                                        Strings.reset,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'DMSans_Regular',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      /*Navigator.push(
                                    ctxPDS!,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage(context),
                                    ),
                                  );*/
                                    },
                                    child: Container(
                                      width: mainWidth*0.40.sp,
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10,left: 20.sp,right: 20.sp,),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.sp)),
                                        color: ColorAll.colorPrimaryDark,
                                      ),
                                      child: Text(
                                        Strings.apply,
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
              ],
            ),
          ),
        );
      },
    );
  }

  void determinateIndicator() {
    new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (value == 1) {
          timer.cancel();
        } else {
          value = value + 0.1;
        }
      });
    });
  }
}
