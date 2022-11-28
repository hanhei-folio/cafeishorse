class CafeModel {
  CafeModel.fromJson(dynamic json) {

    id = json['id'];
    placeName = json['place_name'];
    phone = json['phone'];
    x = json['x'];
    y = json['y'];
    roadAddressName = json['road_address_name'];
    mainPhotoUrl = json['main_photo'];
    star = json['star_mean'];
    if (json['bookmark_cnt'] != null) {
      bookmarkCount = int.parse(json['bookmark_cnt'].toString());
    }
  }

  int? id;
  String? placeName;
  String? phone;
  String? x;
  String? y;
  String? roadAddressName;
  String? mainPhotoUrl;
  String? star;
  int? bookmarkCount;
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