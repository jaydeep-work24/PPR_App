class ZipcodeByCityModel {
  List<Zipcodes>? zipcodes;

  ZipcodeByCityModel({this.zipcodes});

  ZipcodeByCityModel.fromJson(Map<String, dynamic> json) {
    if (json['zipcodes'] != null) {
      zipcodes = <Zipcodes>[];
      json['zipcodes'].forEach((v) {
        zipcodes?.add(new Zipcodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.zipcodes != null) {
      data['zipcodes'] = this.zipcodes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Zipcodes {
  String? sId;
  int? name;
  String? state;
  String? district;
  String? city;
  String? area;
  String? createdDate;
  String? modifiedDate;
  int? iV;

  Zipcodes(
      {this.sId,
        this.name,
        this.state,
        this.district,
        this.city,
        this.area,
        this.createdDate,
        this.modifiedDate,
        this.iV});

  Zipcodes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    state = json['state'];
    district = json['district'];
    city = json['city'];
    area = json['area'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['state'] = this.state;
    data['district'] = this.district;
    data['city'] = this.city;
    data['area'] = this.area;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['__v'] = this.iV;
    return data;
  }
}