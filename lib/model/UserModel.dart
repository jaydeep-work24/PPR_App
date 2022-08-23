class UserModel {
  String? message;
  String? auth;
  bool? response;
  String? error;
  Users? users;

  UserModel({this.message, this.auth, this.response, this.users});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    auth = json['auth'];
    response = json['response'];
    error = json['error'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['auth'] = this.auth;
    data['response'] = this.response;
    data['error'] = this.error;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? name;
  int? phoneNumber;
  String? emailID;
  String? dateOfBirth;
  String? gender;
  String? occupation;
  String? businessName;
  String? designation;
  String? electionCardNo;
  String? address;
  int? pincode;
  String? country;
  String? state;
  String? city;
  SocialMedia? socialMedia;
  bool? status;
  String? image;
  String? politicalPrefrence;
  String? createdDate;
  String? modifiedDate;
  int? iV;

  Users(
      {this.sId,
      this.name,
      this.phoneNumber,
      this.emailID,
      this.dateOfBirth,
      this.gender,
      this.occupation,
      this.businessName,
      this.designation,
      this.electionCardNo,
      this.address,
      this.pincode,
      this.country,
      this.state,
      this.city,
      this.socialMedia,
      this.status,
      this.image,
      this.politicalPrefrence,
      this.createdDate,
      this.modifiedDate,
      this.iV});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    phoneNumber = json['Phone_number'];
    emailID = json['EmailID'];
    dateOfBirth = json['Date_of_Birth'];
    gender = json['Gender'];
    occupation = json['Occupation'];
    businessName = json['BusinessName'];
    designation = json['Designation'];
    electionCardNo = json['ElectionCardNo'];
    address = json['Address'];
    pincode = json['Pincode'];
    country = json['Country'];
    state = json['State'];
    city = json['City'];
    socialMedia = json['SocialMedia'] != null
        ? new SocialMedia.fromJson(json['SocialMedia'])
        : null;
    status = json['Status'];
    image = json['Image'];
    politicalPrefrence = json['Political_Prefrence'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Phone_number'] = this.phoneNumber;
    data['EmailID'] = this.emailID;
    data['Date_of_Birth'] = this.dateOfBirth;
    data['Gender'] = this.gender;
    data['Occupation'] = this.occupation;
    data['BusinessName'] = this.businessName;
    data['Designation'] = this.designation;
    data['ElectionCardNo'] = this.electionCardNo;
    data['Address'] = this.address;
    data['Pincode'] = this.pincode;
    data['Country'] = this.country;
    data['State'] = this.state;
    data['City'] = this.city;
    if (this.socialMedia != null) {
      data['SocialMedia'] = this.socialMedia!.toJson();
    }
    data['Status'] = this.status;
    data['Image'] = this.image;
    data['Political_Prefrence'] = this.politicalPrefrence;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['__v'] = this.iV;
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
