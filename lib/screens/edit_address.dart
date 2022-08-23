import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ppr/screens/home_screen.dart';
import 'package:ppr/screens/welcome_screen.dart';
import 'package:ppr/utils/Strings.dart';

BuildContext? ctxEADDS;

class EditAddressPage extends StatelessWidget {
  EditAddressPage(BuildContext ctxEADDS1, {Key? key}) : super(key: key) {
    ctxEADDS = ctxEADDS1;
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
                builder: (ctxProg) => MyEditAddressPage(),
              ),
            ),
          );
        });
  }
}

class MyEditAddressPage extends StatefulWidget {
  const MyEditAddressPage({Key? key}) : super(key: key);

  @override
  MyEditAddressPageState createState() => MyEditAddressPageState();
}

class MyEditAddressPageState extends State<MyEditAddressPage> {
  TextEditingController controllAddressLine1 = TextEditingController();
  TextEditingController controllAddressLine2 = TextEditingController();
  TextEditingController controllPinCode = TextEditingController();
  TextEditingController controllCity = TextEditingController();
  TextEditingController controllState = TextEditingController();
  TextEditingController controllCountry = TextEditingController();

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
                          Navigator.of(ctxEADDS!).pop();
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
                            Strings.edit_address,
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
                          Strings.address1,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllAddressLine1,
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
                            hintText: Strings.address1,
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
                          Strings.address2,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllAddressLine2,
                          // textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                          cursorColor: ColorAll.colorPrimaryDark,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: Strings.address2,
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
                          Strings.pin_code,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllPinCode,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            color: ColorAll.colorPrimaryDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                          cursorColor: ColorAll.colorItemBg,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                            hintText: Strings.pin_code,
                            border: InputBorder.none,
                            counterText: "",
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
                          Strings.city,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllCity,
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
                            hintText: Strings.city,
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
                          Strings.state,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllState,
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
                            hintText: Strings.state,
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
                          Strings.country,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorAll.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: controllCountry,
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
                            hintText: Strings.country,
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: mainWidth,
              margin: EdgeInsets.only(top: 10.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
              padding: EdgeInsets.only(
                  top: 10.sp, bottom: 10.sp, left: 20.sp, right: 20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.sp)),
                color: ColorAll.colorPrimaryDark,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    ctxEADDS!,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(context),
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        date = selectedDate.toLocal().toString();
        DateFormat.yMMMEd().format(selectedDate);

        outputDate = outputFormat.format(selectedDate);
        print("=====>" + selected.day.toString());
        print("=====>" + selected.month.toString());
        print("=====>" + selected.year.toString());
        print("=====>" + selectedDate.toLocal().toString());
        print("=====>" + DateFormat.yMMMEd().format(selectedDate));
        print("=====>" + outputDate);
      });
  }
}
