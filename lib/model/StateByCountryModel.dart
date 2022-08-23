class StateByCountryModel {
  List<States>? states;

  StateByCountryModel({this.states});

  StateByCountryModel.fromJson(Map<String, dynamic> json) {
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states?.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.states != null) {
      data['states'] = this.states?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  String? sId;
  String? country;
  String? name;
  String? createdDate;
  String? modifiedDate;
  int? iV;

  States(
      {this.sId,
        this.country,
        this.name,
        this.createdDate,
        this.modifiedDate,
        this.iV});

  States.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    name = json['name'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['country'] = this.country;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['__v'] = this.iV;
    return data;
  }
}
