class PPreferenceModel {
  String? message;
  bool? response;
  List<Data>? data;

  PPreferenceModel({this.message, this.response, this.data});

  PPreferenceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['response'] = this.response;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  Image? image;

  Data({this.id, this.name, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image?.toJson();
    }
    return data;
  }
}

class Image {
  String? imageName;
  String? path;

  Image({this.imageName, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageName'] = this.imageName;
    data['path'] = this.path;
    return data;
  }
}