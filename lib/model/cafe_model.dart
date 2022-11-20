import 'dart:convert';

class CafeModel {
  CafeModel.fromJson(dynamic jsonString) {

    id = jsonString['id'];
    place_name = jsonString['place_name'];
    phone = jsonString['phone'];
    x = jsonString['x'];
    y = jsonString['y'];
  }

  int? id;
  String? place_name;
  String? phone;
  String? x;
  String? y;
}



// import 'dart:convert';
//
// class CafeModel {
//   CafeModel.fromJson(dynamic jsonString) {
//
//     name = jsonString['name'];
//     charactor = jsonString['charactor'];
//     grade = jsonString['grade'];
//     location = jsonString['Location'];
//   }
//
//   String? name;
//   String? charactor;
//   int? grade;
//   String? location;
// }