import 'dart:ffi';

class DetailsUpadateModel {
  Int? id;
  String? title;
  String? description;
  String? status;
  String? date;

  DetailsUpadateModel(this.title, this.description, this.status, this.date);
  DetailsUpadateModel.withID(
      this.id, this.title, this.description, this.status, this.date);

  Map<String, dynamic> detailsMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map["id"] = id;
    }
    map["title"] = title;
    map["description"] = description;
    map["status"] = status;
    map["date"] = date;
    return map;
  }

  DetailsUpadateModel.fromMap(Map<String, dynamic> map, this.id, this.title,
      this.description, this.status, this.date) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
    status = map["status"];
    date = map["date"];
  }
}
