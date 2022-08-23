import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final String tableUser = 'user';
final String columnId = '_id';
final String columnName = 'name';
final String columnPhone = 'phone';
final String columnEmail = 'email';

class Util {
  static void showToast(String string) {
    Fluttertoast.showToast(
        msg: "$string",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showToastLong(String string) {
    Fluttertoast.showToast(
        msg: "$string",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  static String IS_LOGIN = "is_login";

  static String ID = "id";
  static String EMAIL = "email";
  static String AUTH_TOKEN = "auth";
  static String FIRST_NAME = "first_name";
  static String LAST_NAME = "last_name";
  static String USERNAME = "username";
  static String DOB = "date_of_birth";
  static String B_FIRST_NAME = "b_first_name";
  static String B_LAST_NAME = "b_last_name";
  static String B_COMPANY = "b_company";
  static String B_ADDRESS_1 = "b_address_1";
  static String B_ADDRESS_2 = "b_address_2";
  static String B_CITY = "b_city";
  static String B_POSTCODE = "b_postcode";
  static String B_COUNTRY = "b_country";
  static String B_STATE = "b_state";
  static String B_EMAIL = "b_email";
  static String B_PHONE = "b_phone";
  static String S_FIRST_NAME = "s_first_name";
  static String S_LAST_NAME = "s_last_name";
  static String S_COMPANY = "s_company";
  static String S_ADDRESS_1 = "s_address_1";
  static String S_ADDRESS_2 = "s_address_2";
  static String S_CITY = "s_city";
  static String S_POSTCODE = "s_postcode";
  static String S_COUNTRY = "s_country";
  static String S_STATE = "s_state";
  static String S_PHONE = "s_phone";
  static String AVATAR_URL = "avatar_url";
}

/*showProgress() {
  return ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.black38,
    borderRadius: 5.0,
    text: 'Loading...',
  );
}*/
