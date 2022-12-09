class CafeModel {
  CafeModel.fromJson(dynamic json) {

    id = json['id'];
    placeName = json['place_name'];
    // phone = json['phone'];
    x = json['x'];
    y = json['y'];
    roadAddressName = json['road_address_name'];
    mainPhotoUrl = json['main_photo'];
    star = json['star_mean'];
    if (json['comment_count']!= null) {
      commentCount = int.parse(json['comment_count'].toString());
    }
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
  int? commentCount;
  int? bookmarkCount;
}
