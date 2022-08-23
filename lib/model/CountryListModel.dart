
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CountryListModel {
  List<StatesList>? states;

  CountryListModel({this.states});

  CountryListModel.fromJson(Map<String, dynamic> json) {
    if (json['states'] != null) {
      states = <StatesList>[];
      json['states'].forEach((v) {
        states?.add(new StatesList.fromJson(v));
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

@JsonSerializable()
class StatesList {
  String? sId;
  String? name;
  String? createdDate;
  String? modifiedDate;
  int? iV;

  StatesList({this.sId, this.name, this.createdDate, this.modifiedDate, this.iV});

  StatesList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['__v'] = this.iV;
    return data;
  }
}
