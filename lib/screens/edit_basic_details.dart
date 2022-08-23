import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ppr/screens/home_screen.dart';
import 'package:ppr/screens/signUpScreens/signup_address.dart';
import 'package:ppr/screens/signin_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxEBDS;

class EditbasicDetailPage extends StatelessWidget {
  EditbasicDetailPage(BuildContext ctxEBDS1, {Key? key}) : super(key: key) {
    ctxEBDS = ctxEBDS1;
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
                builder: (ctxProg) => MyEditbasicDetailPage(),
              ),
            ),
          );
        });
  }
}

class MyEditbasicDetailPage extends StatefulWidget {
  const MyEditbasicDetailPage({Key? key}) : super(key: key);

  @override
  MyEditbasicDetailPageState createState() => MyEditbasicDetailPageState();
}

class MyEditbasicDetailPageState extends State<MyEditbasicDetailPage> {
  TextEditingController controllName = TextEditingController();
  TextEditingController controllPhoneNumber = TextEditingController();
  TextEditingController controllEmailId = TextEditingController();
  TextEditingController controllBusinessName = TextEditingController();
  TextEditingController controllDesignation = TextEditingController();
  TextEditingController controllElectionCardNo = TextEditingController();

  File _image1 = new File("");

  String date = "";
  DateTime selectedDate = DateTime.now();
  var outputFormat = DateFormat('dd-MM-yyyy');
  var outputDate;

  bool isChecked = false;

  void _showPicker(context) {
    print("Pick===>" + _image1.path);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Wrap(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    'Profile Photo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_library,
                              color: Colors.black,
                            ),
                            Text(
                              'Gallery',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _imgFromCamera();
                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_camera,
                              color: Colors.black,
                            ),
                            Text(
                              'Camera',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Strings.cancel,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      try {
        File imageFile = File(pickedFile.path);
        setState(() {
          _image1 = imageFile;
          // _cropImage(imageFile);
        });
      } on Exception catch (e) {
        setState(() {
          // _image1 = e;
        });
      }
    }
  }

  _imgFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      // File imageFile = File(pickedFile[0].path);
      setState(() {
        _image1 = File(<XFile>[pickedFile][0].path);
        print("Pick ewewhjk===>" + _image1.path);
        // _cropImage(imageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
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
                          Navigator.of(ctxEBDS!).pop();
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
                            Strings.edit_basic_details,
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
                padding: EdgeInsets.only(left: 20.sp,top: 10.sp,right: 20.sp),
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: _image1.path == ""
                            ? Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                            color: ColorAll.uploadbutton,
                            border: Border.all(
                              color: ColorAll.colorAccent,
                              width: 1,
                            ),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/upload_img.png',
                                  height: 40,
                                  width: 40,
                                ),
                                Text(
                                  Strings.upload_profile_img,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorAll.colorAccent,
                                      fontSize: 12.sp),
                                )
                              ]),
                        )
                            : Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                            color: ColorAll.uploadbutton,
                            border: Border.all(
                              color: ColorAll.colorAccent,
                              width: 1,
                            ),
                          ),
                          child: Image.file(
                            _image1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.full_name,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
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
                          controller: controllName,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                          cursorColor: ColorAll.colorItemBg,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: Strings.full_name,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 0.sp,
                              bottom: 10.sp,
                            ),
                            counterText: "",
                            hintStyle: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.phone_number,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllPhoneNumber,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
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
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.email_id,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllEmailId,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                          cursorColor: ColorAll.colorItemBg,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: Strings.enter_email,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 0.sp,
                              bottom: 10.sp,
                            ),
                            hintStyle: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.dob,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: mainWidth,
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
                              color: ColorAll.colorPrimaryDark,
                              width: 1,
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                  outputDate == null ? Strings.select_dob : outputDate,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: ColorAll.colorPrimaryDark,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Image.asset(
                                    'assets/images/calender.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.gender,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.select_gender,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: ColorAll.textColors,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Image.asset(
                                  'assets/images/down_arrow.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.occupation,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.business,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorAll.colorPrimaryDark,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Image.asset(
                                  'assets/images/down_arrow.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.your_business_name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllBusinessName,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans_Regular',
                            fontSize: 15.sp,
                          ),
                          cursorColor: ColorAll.colorItemBg,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: Strings.business_name_txt,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 0.sp,
                              bottom: 10.sp,
                            ),
                            hintStyle: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.your_designation,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllDesignation,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans_Regular',
                            fontSize: 15.sp,
                          ),
                          cursorColor: ColorAll.colorItemBg,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: Strings.designation_txt,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 0.sp,
                              bottom: 10.sp,
                            ),
                            hintStyle: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontFamily: 'DMSans_Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          Strings.election_cardno,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorAll.textColors,
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
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
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllElectionCardNo,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,

                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontSize: 15.sp,
                          ),
                          cursorColor: ColorAll.colorPrimaryDark,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: Strings.election_cardno,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 0.sp,
                              bottom: 10.sp,
                            ),
                            hintStyle: TextStyle(
                              color: ColorAll.textColors,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mainWidth,
                        margin: EdgeInsets.only(top: 10.sp, bottom: 20.sp),
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.sp)),
                          color: ColorAll.colorPrimaryDark,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              ctxEBDS!,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomePage(context),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

}
