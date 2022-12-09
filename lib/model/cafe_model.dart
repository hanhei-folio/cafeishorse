class CafeModel {
  CafeModel.fromJson(dynamic json) {

    if(json['id']!=null){
      id = int.parse(json['id'].toString());
    }

    placeName = json['place_name'];
    // phone = json['phone'];
    x = json['x'];
    y = json['y'];
    roadAddressName = json['road_address_name'];
    if(json['main_photo']==0){
      mainPhotoUrl = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA2MjVfNDQg%2FMDAxNjU2MTQxNDg4NzI3.JROswhJe6tHycSDhlAheaV_0CQjIiZuNdHrgmz_usv0g.EY41V6zjC_geMseCotZOjoVbrflcd3arRDhfFHh8Kiwg.JPEG.nsc1029%2F20220625%25A3%25DF094154.jpg&type=sc960_832";
    }
    else{
      mainPhotoUrl = json['main_photo'];
    }

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
