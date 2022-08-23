class CityByStateModel {
  List<Cities>? cities;

  CityByStateModel({this.cities});

  CityByStateModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities?.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['cities'] = this.cities?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? sId;
  String? state;
  String? district;
  String? name;
  String? createdDate;
  String? modifiedDate;
  int? iV;

  Cities(
      {this.sId,
        this.state,
        this.district,
        this.name,
        this.createdDate,
        this.modifiedDate,
        this.iV});

  Cities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    district = json['district'];
    name = json['name'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['district'] = this.district;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['__v'] = this.iV;
    return data;
  }
}
