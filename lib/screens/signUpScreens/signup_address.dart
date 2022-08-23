import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:ppr/model/CityByStateModel.dart';
import 'package:ppr/model/CountryListModel.dart';
import 'package:ppr/model/SignUpReqModel.dart';
import 'package:ppr/model/ZipcodeByCityModel.dart';
import 'package:ppr/screens/signUpScreens/signup_social_media.dart';
import 'package:ppr/screens/signin_screen.dart';
import 'package:ppr/utils/app_constants.dart';

import '../../model/StateByCountryModel.dart';
import '../../utils/Strings.dart';
import '../welcome_screen.dart';

BuildContext? ctxSUA;
SignUpReqModel? signUpReqModelAddr;
var ctxProgressSUA;

class SignUpAddress extends StatelessWidget {
  SignUpAddress(BuildContext ctxSUA1, SignUpReqModel? signUpReqModel1,
      {Key? key})
      : super(key: key) {
    ctxSUA = ctxSUA1;
    signUpReqModelAddr = signUpReqModel1;
    // var nm = signUpReqModelAddr?.name.toString() ?? "";
    // print("nameed==-=->"+nm);
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
                builder: (ctxProg) => MySignupAddressPage(ctxProg),
              ),
            ),
          );
        });
  }
}

class MySignupAddressPage extends StatefulWidget {
  MySignupAddressPage(BuildContext ctxProg, {Key? key}) : super(key: key) {
    ctxProgressSUA = ctxProg;
  }

  @override
  MySignupAddressPageState createState() => MySignupAddressPageState();
}

class MySignupAddressPageState extends State<MySignupAddressPage> {
  TextEditingController controllAddress1 = TextEditingController();
  TextEditingController controllAddress2 = TextEditingController();
  TextEditingController controllPincode = TextEditingController();
  TextEditingController controllCity = TextEditingController();
  TextEditingController controllState = TextEditingController();
  TextEditingController controllCountry = TextEditingController();

  late CountryListModel countrylist;
  late StateByCountryModel  statelist;
  late CityByStateModel citylist;
  late ZipcodeByCityModel zipcodelist;

  String? selectedZipcode = "Select Zipcode";
  String? selectedCity = "Select City";
  String? selectedState = "Select State";
  String? selectedCountry = "Select Country";
  List<String> countryListMain = ["Select Country"];
  List<String> stateListMain = ["Select State"];
  List<String> cityListMain = ["Select City"];
  List<String> zipcodeListMain = ["Select Zipcode"];

  String idCountry = "";
  String idState = "";
  String idCity = "";


  @override
  void initState() {
    super.initState();
    getCountry();
    // getStates();
    // getCites();
    // getZipcodes();
  }

  Future getCountry() async {
    var progress;
    Timer(const Duration(milliseconds: 20), () {
      progress = ProgressHUD.of(ctxProgressSUA);
      progress.show();

      Timer(const Duration(seconds: 1), () {
        progress.dismiss();
      });
    });

    print(Uri.parse(AppConstants.BASE_URL + AppConstants.COUNTRY_URI));
    http.Response response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.COUNTRY_URI),
        headers: {
          "Content-Type": "Application/json",
          'Authorization': 'Bearer ${AppConstants.BEARER_TOKEN}',
        });
    print("http res==>" + response.body.toString());
    var listCust = json.decode(response.body);

    countrylist = CountryListModel.fromJson(listCust);
    setState(() {
      // var nm = countrylist.states?[0].name.toString() ?? "";
      // print("--------->$nm");
      countryListMain.clear();
      countryListMain.add(selectedCountry!);
      countrylist.states?.forEach((element) {
        countryListMain.add(element.name.toString());
      });
    });

  }

  getStates(String country) async {

    String cntId = "";
    countrylist.states?.forEach((element) {
      if(element.name == country){
        cntId = element.sId.toString();
        idCountry = cntId;
      }
    });

    http.Response response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.STATE_URI+cntId),
        headers: {
          "Content-Type": "Application/json",
          'Authorization': 'Bearer ${AppConstants.BEARER_TOKEN}',
        });

    print("stateURI===> ${AppConstants.BASE_URL}${AppConstants.STATE_URI}");

    var listCust = json.decode(response.body);

    statelist = StateByCountryModel.fromJson(listCust);
    setState(() {
      // var nm = statelist.states?[0].name.toString() ?? "";
      // print("--------->$nm");
      stateListMain.clear();
      stateListMain.add(selectedState!);
      statelist.states?.forEach((element) {
        stateListMain.add(element.name.toString());
      });
    });
  }

  getCites(String state) async {

    String stId = "";
    statelist.states?.forEach((element) {
      if(element.name == state){
        stId = element.sId.toString();
        idState = stId;
      }
    });

    http.Response response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.CITY_URI + stId),
        headers: {
          "Content-Type": "Application/json",
          'Authorization': 'Bearer ${AppConstants.BEARER_TOKEN}',
        }); //using JWT token for WP authentication is not needed
    print("response==>${response.body}");
    var listCust = json.decode(response.body);

    citylist = CityByStateModel.fromJson(listCust);
    setState(() {
      // var nm = statelist.states?[0].name.toString() ?? "";
      // print("--------->$nm");
      cityListMain.clear();
      cityListMain.add(selectedCity!);
      citylist.cities?.forEach((element) {
        cityListMain.add(element.name.toString());
      });
    });
  }

  getZipcodes(String city) async {
    String ctId = "";
    citylist.cities?.forEach((element) {
      if(element.name == city){
        ctId = element.sId.toString();
        idCity = ctId;
      }
    });

    http.Response response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.ZIPCODE_URI + ctId),
        headers: {
          "Content-Type": "Application/json",
          'Authorization': 'Bearer ${AppConstants.BEARER_TOKEN}',
        });

    print("zipcodeURI===> ${AppConstants.BASE_URL}${AppConstants.ZIPCODE_URI}");
    var listCust = json.decode(response.body);

    zipcodelist = ZipcodeByCityModel.fromJson(listCust);
    setState(() {
      // var nm = statelist.states?[0].name.toString() ?? "";
      // print("--------->$nm");
      zipcodeListMain.clear();
      zipcodeListMain.add(selectedZipcode!);
      zipcodelist.zipcodes?.forEach((element) {
        zipcodeListMain.add(element.name.toString());
      });
    });
  }

  // SignUpReqModel signUpReqModel = SignUpReqModel();

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
                  Navigator.of(ctxSUA!).pop();
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
                        Strings.step2address_details,
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
                              Navigator.of(ctxSUA!).pop();
                            },
                            child: Image.asset(
                              'assets/images/circle_left.png',
                              color: ColorAll.colorAccent,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("image--->${signUpReqModelAddr!.image}");
                              print("name--->${signUpReqModelAddr!.name}");
                              print(
                                  "phone--->${signUpReqModelAddr!.phoneNumber}");
                              print(
                                  "business--->${signUpReqModelAddr!.businessName}");
                              print(
                                  "desig--->${signUpReqModelAddr!.designation}");
                              print(
                                  "dob--->${signUpReqModelAddr!.dateOfBirth}");
                              print("gender--->${signUpReqModelAddr!.gender}");
                              print(
                                  "occu--->${signUpReqModelAddr!.occupation}");
                              print(
                                  "eleid--->${signUpReqModelAddr!.electionCardNo}");
                              signUpReqModelAddr?.address =
                                  controllAddress1.text.trim().toString();
                              signUpReqModelAddr?.address =
                                  controllAddress2.text.trim().toString();
                              signUpReqModelAddr?.pincode = int.parse(
                                  selectedZipcode.toString());
                              signUpReqModelAddr?.city = idCity;
                              signUpReqModelAddr!.state = idState;
                              signUpReqModelAddr!.country = idCountry;
                              /* if (controllAddress1.text.trim().isEmpty) {
                                Util.showToast("Enter ${Strings.address1}");
                              } else if (controllAddress2.text.trim().isEmpty) {
                                Util.showToast("Enter ${Strings.address2}");
                              } else if (controllPincode.text.trim().isEmpty) {
                                Util.showToast("Enter $Strings.pin_code");
                              } else if (controllCity.text.trim().isEmpty) {
                                Util.showToast(Strings.enter_city);
                              } else if (controllState.text.trim().isEmpty) {
                                Util.showToast(Strings.enter_state);
                              } else if (controllCountry.text.trim().isEmpty) {
                                Util.showToast(Strings.enter_country);
                              } else {
                                signUpReqModelAddr?.address =
                                    controllAddress1.text.trim().toString();
                                signUpReqModelAddr?.address =
                                    controllAddress2.text.trim().toString();
                                signUpReqModelAddr?.pincode =
                                    controllPincode.text as int?;
                                signUpReqModelAddr?.city =
                                    controllCity.text.trim().toString();
                                signUpReqModelAddr!.state =
                                    controllState.text.trim().toString();
                                signUpReqModelAddr!.country =
                                    controllCountry.text.trim().toString();*/
                              Navigator.push(
                                ctxSUA!,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpSocialmedia(
                                          context, signUpReqModelAddr!),
                                ),
                              );
                              // }
                            },
                            child: Image.asset(
                              'assets/images/circle_right.png',
                              color: ColorAll.colorAccent,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
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
                ),
                child: TextField(
                  controller: controllAddress1,
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
                    hintText: Strings.address1_text,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 0.sp,
                      bottom: 10.sp,
                    ),
                    counterText: "",
                    hintStyle: TextStyle(
                      color: ColorAll.textColors,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
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
                    color: ColorAll.colorPrimaryDark,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: controllAddress2,
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Strings.address2_text,
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
                height: 40.sp,
                margin: EdgeInsets.only(
                  top: 5.sp,
                  bottom: 8.sp,
                ),
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
                  // hint: Text(Strings.city),
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
                  value: selectedZipcode,
                  items: zipcodeListMain
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
                    selectedZipcode = value.toString();
                    print("sel=-=->$value");
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  Strings.city,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorAll.textColors,
                  ),
                ),
              ),
              Container(
                height: 40.sp,
                margin: EdgeInsets.only(
                  top: 5.sp,
                  bottom: 8.sp,
                ),
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
                  // hint: Text(Strings.city),
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
                  value: selectedCity,
                  items: cityListMain
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
                    selectedCity = value.toString();
                    print(value.toString());
                    idCity = "";
                    if(value.toString() != "Select City") {
                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");
                      getZipcodes(value.toString());
                    }else{
                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");
                    }
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  Strings.state,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorAll.textColors,
                  ),
                ),
              ),
              Container(
                height: 40.sp,
                margin: EdgeInsets.only(
                  top: 5.sp,
                  bottom: 8.sp,
                ),
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
                  // hint: Text(Strings.city),
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
                  value: selectedState,
                  items: stateListMain
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
                    selectedState = value.toString();
                    print(value.toString());
                    idState = "";
                    idCity = "";
                    if(value.toString() != "Select State") {
                      selectedCity =  "Select City";
                      cityListMain.clear();
                      cityListMain.add("Select City");

                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");

                      getCites(value.toString());
                    }else{
                      selectedCity =  "Select City";
                      cityListMain.clear();
                      cityListMain.add("Select City");

                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");
                    }
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  Strings.country,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorAll.textColors,
                  ),
                ),
              ),
              Container(
                height: 40.sp,
                margin: EdgeInsets.only(
                  top: 5.sp,
                  bottom: 8.sp,
                ),
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
                  // hint: Text(Strings.city),
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
                  value: selectedCountry ?? "",
                  items: countryListMain
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
                    selectedCountry = value.toString();
                    idCountry = "";
                    idState = "";
                    idCity = "";
                    print("selectedCountry=-=->"+value.toString());
                    if(value.toString() != "Select Country") {
                      selectedState =  "Select State";
                      stateListMain.clear();
                      stateListMain.add("Select State");

                      selectedCity =  "Select City";
                      cityListMain.clear();
                      cityListMain.add("Select City");

                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");

                      getStates(value.toString());
                    }else{
                      selectedState =  "Select State";
                      stateListMain.clear();
                      stateListMain.add("Select State");

                      selectedCity =  "Select City";
                      cityListMain.clear();
                      cityListMain.add("Select City");

                      selectedZipcode =  "Select Zipcode";
                      zipcodeListMain.clear();
                      zipcodeListMain.add("Select Zipcode");
                    }

                  }),
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
                    print("image--->${signUpReqModelAddr!.image}");
                    print("name--->${signUpReqModelAddr!.name}");
                    print("phone--->${signUpReqModelAddr!.phoneNumber}");
                    print("business--->${signUpReqModelAddr!.businessName}");
                    print("desig--->${signUpReqModelAddr!.designation}");
                    print("dob--->${signUpReqModelAddr!.dateOfBirth}");
                    print("gender--->${signUpReqModelAddr!.gender}");
                    print("occu--->${signUpReqModelAddr!.occupation}");
                    print("eleid--->${signUpReqModelAddr!.electionCardNo}");
                    /* if (controllAddress1.text.trim().isEmpty) {
                      Util.showToast("Enter ${Strings.address1}");
                    } else if (controllAddress2.text.trim().isEmpty) {
                      Util.showToast("Enter ${Strings.address2}");
                    } else if (controllPincode.text.trim().isEmpty) {
                      Util.showToast("Enter $Strings.pin_code");
                    } else if (controllCity.text.trim().isEmpty) {
                      Util.showToast(Strings.enter_city);
                    } else if (controllState.text.trim().isEmpty) {
                      Util.showToast(Strings.enter_state);
                    } else if (controllCountry.text.trim().isEmpty) {
                      Util.showToast(Strings.enter_country);
                    } else {*/
                    signUpReqModelAddr?.address =
                        controllAddress1.text.trim().toString();
                    signUpReqModelAddr?.address =
                        controllAddress2.text.trim().toString();
                    signUpReqModelAddr?.pincode =
                        int.parse(selectedZipcode.toString());
                    signUpReqModelAddr?.city = idCity;
                    signUpReqModelAddr!.state = idState;
                    signUpReqModelAddr!.country = idCountry;
                    Navigator.push(
                      ctxSUA!,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SignUpSocialmedia(context, signUpReqModelAddr!),
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
                      ctxSUA!,
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
