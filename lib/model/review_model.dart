class ReviewModel {
  ReviewModel.fromJson(dynamic json) {
    contents = json['contents'];
    date = json['date'];
    if (json['id'] != null) {
      id = int.parse(json['id']);
    }
    id = json['id'];
    kakaoMapUserId = json['kakaomapuserid'];
    if (json['likecnt'] != null) {
      likecnt = int.parse(json['likecnt']);
    }
    if (json['photocnt'] != null) {
      photocnt = int.parse(json['photocnt']);
    }
    if (json['photolist'] != null) {
      for (var url in json['photolist']) {
        photoUrls.add(url.toString());
      }
    }
    if (json['point'] != null) {
      point = int.parse(json['point']);
    }
    if (json['store'] != null) {
      cafeId = int.parse(json['store']);
    }
    userCommentAverageScore = json['usercommentaveragescore'];
    if (json['usercommentcount'] != null) {
      userCommentCnt = int.parse(json['usercommentcount']);
    }
    username = json['username'];
  }

  String? contents;
  String? date;
  int? id;
  String? kakaoMapUserId;
  int? likecnt;
  int? photocnt;
  List<String> photoUrls = [];
  int? point;
  int? cafeId;
  String? userCommentAverageScore;
  int? userCommentCnt;
  String? username;
}
