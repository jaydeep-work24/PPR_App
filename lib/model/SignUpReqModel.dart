import 'package:json_annotation/json_annotation.dart';

class SignUpReqModel {
  String? name;
  int? phoneNumber;
  String? businessName;
  String? designation;
  String? emailID;
  String? dateOfBirth;
  String? gender;
  String? occupation;
  int? electionCardNo;
  String? address;
  int? pincode;
  String? city;
  String? politicalPrefrence;
  String? state;
  String? country;
  String? status;
  String? image;
  SocialMedia? socialMedia;

  SignUpReqModel(
      {this.name,
        this.phoneNumber,
        this.businessName,
        this.designation,
        this.emailID,
        this.dateOfBirth,
        this.gender,
        this.occupation,
        this.electionCardNo,
        this.address,
        this.pincode,
        this.city,
        this.politicalPrefrence,
        this.state,
        this.country,
        this.status,
        this.image,
        this.socialMedia});

  SignUpReqModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    phoneNumber = json['Phone_number'];
    businessName = json['BusinessName'];
    designation = json['Designation'];
    emailID = json['EmailID'];
    dateOfBirth = json['Date_of_Birth'];
    gender = json['Gender'];
    occupation = json['Occupation'];
    electionCardNo = json['ElectionCardNo'];
    address = json['Address'];
    pincode = json['Pincode'];
    city = json['City'];
    politicalPrefrence = json['Political_Prefrence'];
    state = json['State'];
    country = json['Country'];
    status = json['Status'];
    image = json['Image'];
    socialMedia = json['SocialMedia'] != null
        ? new SocialMedia.fromJson(json['SocialMedia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Phone_number'] = this.phoneNumber;
    data['BusinessName'] = this.businessName;
    data['Designation'] = this.designation;
    data['EmailID'] = this.emailID;
    data['Date_of_Birth'] = this.dateOfBirth;
    data['Gender'] = this.gender;
    data['Occupation'] = this.occupation;
    data['ElectionCardNo'] = this.electionCardNo;
    data['Address'] = this.address;
    data['Pincode'] = this.pincode;
    data['City'] = this.city;
    data['Political_Prefrence'] = this.politicalPrefrence;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Status'] = this.status;
    data['Image'] = this.image;
    if (this.socialMedia != null) {
      data['SocialMedia'] = this.socialMedia!.toJson();
    }
    return data;
  }
}

class SocialMedia {
  String? facebook;
  String? twitter;
  String? instagram;
  String? kho;

  SocialMedia({this.facebook, this.twitter, this.instagram, this.kho});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    kho = json['kho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['kho'] = this.kho;
    return data;
  }
}
