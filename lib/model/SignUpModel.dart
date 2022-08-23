class SignUpModel {
  bool? response;
  String? message;
  String? error;
  Result? result;

  SignUpModel({this.response, this.message, this.result});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    error = json['error'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
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
  String? sId;
  int? iV;

  Result(
      {this.name,
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
        this.sId,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
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
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['_id'] = this.sId;
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
