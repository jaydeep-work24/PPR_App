import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ppr/model/SignUpReqModel.dart';
import 'package:ppr/screens/signUpScreens/signup_address.dart';
import 'package:ppr/screens/welcome_screen.dart';

import '../../utils/Strings.dart';
import '../signin_screen.dart';

BuildContext? ctxSUBS;
// SignUpReqModel? signUpReqModel;

class SignUpBasic extends StatelessWidget {
  SignUpBasic(BuildContext ctxSUBS1, {Key? key}) : super(key: key) {
    ctxSUBS = ctxSUBS1;
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
                builder: (ctxProg) => MySignupBasicPage(),
              ),
            ),
          );
        });
  }
}

class MySignupBasicPage extends StatefulWidget {
  const MySignupBasicPage({Key? key}) : super(key: key);

  @override
  MySignupBasicPageState createState() => MySignupBasicPageState();
}

class MySignupBasicPageState extends State<MySignupBasicPage> {
  TextEditingController controllName = TextEditingController();
  TextEditingController controllPhoneNumber = TextEditingController();
  TextEditingController controllEmailId = TextEditingController();
  TextEditingController controllBusinessName = TextEditingController();
  TextEditingController controllDesignation = TextEditingController();
  TextEditingController controllVoterId = TextEditingController();
  SignUpReqModel signUpReqModel = SignUpReqModel();
  List<String> genders = [Strings.male, Strings.female];
  List<String> occupations = [
    Strings.business,
    Strings.job,
  ];
  String? selectedGender;
  String? selectedOccupation;

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
    // PickedFile pickedFile = await ImagePicker().pickImage(
    //   source: ImageSource.camera,
    //   imageQuality: 50,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
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

  // Future<Null> _cropImage(File imageFile) async {
  //   croppedFile = await ImageCropper.cropImage(
  //       sourcePath: imageFile.path,
  //       aspectRatioPresets: Platform.isAndroid
  //           ? [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ]
  //           : [
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio5x3,
  //         CropAspectRatioPreset.ratio5x4,
  //         CropAspectRatioPreset.ratio7x5,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.deepOrange,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       iosUiSettings: IOSUiSettings(
  //         title: 'Cropper',
  //       ));
  //   if (croppedFile != null) {
  //     setState(() {
  //       _image1 = croppedFile;
  //       if (_image1 != null) {
  //         print("file Done1" + _image1.absolute.path);
  //         // final bytes = await Io.File(_image1.absolute.path).readAsBytes();
  //         // var _strImage1 = base64Encode(bytes);
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 72, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(ctxSUBS!).pop();
                  // Navigator.pop(context);
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
                        Strings.step1basic_details,
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
                              Navigator.of(ctxSUBS!).pop();
                            },
                            child: Image.asset(
                              'assets/images/circle_left.png',
                              height: 40,
                              width: 40,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              /*if (controllName.text.trim().isEmpty) {
                                Util.showToast(Strings.msg_plz_enter_flnm);
                              } else if (controllPhoneNumber.text
                                  .trim()
                                  .isEmpty) {
                                Util.showToast("Enter ${Strings.phone_number}");
                              } else if (controllEmailId.text.trim().isEmpty) {
                                Util.showToast(Strings.enter_email);
                              } else if (controllBusinessName.text
                                  .trim()
                                  .isEmpty) {
                                Util.showToast(
                                    "Enter ${Strings.your_business_name}");
                              } else if (controllDesignation.text
                                  .trim()
                                  .isEmpty) {
                                Util.showToast(
                                    "Enter ${Strings.your_designation}");
                              } else if (controllVoterId.text.trim().isEmpty) {
                                Util.showToast(Strings.enter_voter_id);
                              } else {*/
                             /* signUpReqModel.image =
                                  _image1.path.trim().toString();
                              signUpReqModel.name =
                                  controllName.text.trim().toString();
                              signUpReqModel.phoneNumber = int.parse(
                                  controllPhoneNumber.text.trim().toString());
                              signUpReqModel.businessName =
                                  controllBusinessName.text.trim().toString();
                              signUpReqModel.designation =
                                  controllDesignation.text.trim().toString();
                              signUpReqModel.emailID =
                                  controllEmailId.text.trim().toString();
                              signUpReqModel.dateOfBirth = outputDate;
                              signUpReqModel.gender = selectedGender;
                              signUpReqModel.occupation = selectedOccupation;
                              signUpReqModel.electionCardNo=int.parse(controllVoterId.text.trim().toString());*/
                              Navigator.push(
                                ctxSUBS!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpAddress(context, signUpReqModel),
                                ),
                              );
                              // }
                            },
                            child: Image.asset(
                              'assets/images/circle_right.png',
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
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
                    color: ColorAll.colorAccent,
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
                  _selectDate(context);
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
                height: 40.sp,
                margin: EdgeInsets.only(top: 5.sp, bottom: 8.sp,),
                // padding: EdgeInsets.only(top: 5.ssp, bottom: 5.ssp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ColorAll.colorPrimaryDark,
                      // set border color
                      width: 1.0.sp), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.sp)), // set rounded corner radius
                ),
                child: DropdownButtonFormField(
                  hint: Text(Strings.select_gender),
                  icon: Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Image.asset(
                      'assets/images/down_arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  isDense: false,
                  iconEnabledColor: ColorAll.colorPrimaryDark,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.fromLTRB(5.sp, -8.sp, 5.sp, 0.sp),
                    border: InputBorder.none,
                  ),
                  value: selectedGender,
                  items: genders
                      .map((String gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(
                              gender,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorAll.colorPrimaryDark,
                                fontFamily: 'DMSans_Regular',
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    selectedGender = value.toString();
                  }),
                ),
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
                height: 40.sp,
                margin: EdgeInsets.only(top: 5.sp, bottom: 8.sp,),
                // padding: EdgeInsets.only(top: 5.ssp, bottom: 5.ssp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ColorAll.colorPrimaryDark,
                      // set border color
                      width: 1.0.sp), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.sp)), // set rounded corner radius
                ),
                child: DropdownButtonFormField(
                  hint: Text("Select ${Strings.occupation}"),
                  isDense: false,
                  iconEnabledColor: ColorAll.colorPrimaryDark,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Image.asset(
                      'assets/images/down_arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.fromLTRB(5.sp, -8.sp, 5.sp, 0.sp),
                    border: InputBorder.none,
                  ),
                  value: selectedOccupation,
                  items: occupations
                      .map((String gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(
                              gender,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorAll.colorPrimaryDark,
                                fontFamily: 'DMSans_Regular',
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    selectedOccupation = value.toString();
                  }),
                ),
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
                  bottom: 24.sp,
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
              Container(
                height: 1,
                color: ColorAll.colorBgHome,
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
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      checkColor: ColorAll.colorAccentDark,
                      activeColor: ColorAll.colorAccent,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        Strings.have_election_card,
                        style: TextStyle(
                          color: ColorAll.colorPrimaryDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  Strings.voter_id,
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
                  controller: controllVoterId,
                  // textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    color: ColorAll.colorPrimaryDark,
                    fontSize: 15.sp,
                  ),
                  cursorColor: ColorAll.colorPrimaryDark,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: Strings.enter_voter_id,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 0.sp,
                      bottom: 10.sp,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        showDescription(context);
                      },
                      child: Image.asset(
                        'assets/images/info.png',
                        height: 24,
                        width: 24,
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
              Container(
                width: mainWidth,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: ColorAll.colorPrimaryDark,
                ),
                child: InkWell(
                  onTap: () {
                    /* if (controllName.text.trim().isEmpty) {
                      Util.showToast(Strings.msg_plz_enter_flnm);
                    } else if (controllPhoneNumber.text.trim().isEmpty) {
                      Util.showToast("Enter ${Strings.phone_number}");
                    } else if (controllEmailId.text.trim().isEmpty) {
                      Util.showToast(Strings.enter_email);
                    } else if (controllBusinessName.text.trim().isEmpty) {
                      Util.showToast("Enter ${Strings.your_business_name}");
                    } else if (controllDesignation.text.trim().isEmpty) {
                      Util.showToast("Enter ${Strings.your_designation}");
                    } else if (controllVoterId.text.trim().isEmpty) {
                      Util.showToast(Strings.enter_voter_id);
                    } else {*/
                    signUpReqModel.image = _image1.path.trim().toString();
                    signUpReqModel.name = controllName.text.trim().toString();
                    signUpReqModel.phoneNumber =
                        int.parse(controllPhoneNumber.text.trim().toString());
                    signUpReqModel.businessName =
                        controllBusinessName.text.trim().toString();
                    signUpReqModel.designation =
                        controllDesignation.text.trim().toString();
                    signUpReqModel.emailID =
                        controllEmailId.text.trim().toString();
                    signUpReqModel.dateOfBirth = outputDate;
                    signUpReqModel.gender = selectedGender;
                    signUpReqModel.occupation = selectedOccupation;
                    signUpReqModel.electionCardNo =
                        int.parse(controllVoterId.text.trim().toString());
                    Navigator.push(
                      ctxSUBS!,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SignUpAddress(context, signUpReqModel),
                      ),
                    );
                    // }
                  },
                  child: Text(
                    Strings.next,
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
                      ctxSUBS!,
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

  // showDescription(ProductData wooDataProduct, int index) {
  showDescription(BuildContext ctx) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;
    print("jsn");
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Container(
            color: ColorAll.colorTransp,
            padding: EdgeInsets.only(
              top: mainHeight * 0.35.sp,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: mainWidth,
                  margin: EdgeInsets.only(
                    top: mainHeight * 0.05.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                    ),
                    color: ColorAll.colorItemBg,
                  ),
                ),
                Container(
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
                SizedBox(
                  width: mainWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: mainWidth,
                        margin: EdgeInsets.only(
                          left: mainWidth * 0.06.sp,
                          right: mainWidth * 0.06.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30.sp),
                              child: Text(
                                Strings.where_you_c,
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
                              // color: Colors.red,
                              width: mainWidth,
                              height: mainHeight * 0.27.sp,
                              margin: EdgeInsets.only(top: 20.sp),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: mainWidth * 0.25.sp,
                                      ),
                                      child: Image.asset(
                                        "assets/images/voter_id_imgs.png",
                                      ),
                                    ),
                                  ),
                                  /*Container(
                                    width:  mainWidth,
                                    height: mainHeight * 0.27.sp,
                                    // color: Colors.yellow,
                                    // padding: EdgeInsets.only(left: 95.sp, top: 30.sp),
                                    margin: EdgeInsets.only(left:(mainWidth/2)*0.92.sp,top: mainHeight * 0.07.sp),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/left_arrow.png",
                                          width: mainWidth * 0.15.sp,
                                          height: 204.sp,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.sp),
                                          child: Text(
                                            Strings.voter_id,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'DMSans_Regular',
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  )*/
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.sp,
                              ),
                              child: Text(
                                Strings.welcome_desc,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorAll.colorPrimaryDark,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans_Regular',
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                width: mainWidth,
                                margin: EdgeInsets.only(top: 20.sp),
                                padding:
                                    EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.sp)),
                                  color: ColorAll.colorPrimaryDark,
                                ),
                                child: Text(
                                  Strings.go_back,
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
