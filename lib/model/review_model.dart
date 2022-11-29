class ReviewModel {
  ReviewModel.fromJson(dynamic json) {
    contents = json['contents'];
    date = json['date'];
    if (json['id'] != null) {
      id = int.parse(json['id'].toString());
    }
    id = json['id'];
    kakaoMapUserId = json['kakaomapuserid'];
    if (json['likecnt'] != null) {
      likecnt = int.parse(json['likecnt'].toString());
    }
    if (json['photocnt'] != null) {
      photocnt = int.parse(json['photocnt'].toString());
    }
    if (json['photolist'] != null) {
      String joinedList = json['photolist'].toString();
      joinedList = joinedList.replaceAll('[', '');
      joinedList = joinedList.replaceAll(']', '');
      joinedList = joinedList.replaceAll(' ', '');
      joinedList = joinedList.replaceAll('\'', '');
      if (joinedList.isNotEmpty) {
        photoUrls = joinedList.split(',');
      }
    }
    if (json['point'] != null) {
      point = int.parse(json['point'].toString());
    }
    if (json['store'] != null) {
      cafeId = int.parse(json['store'].toString());
    }
    userCommentAverageScore = json['usercommentaveragescore'];
    if (json['usercommentcount'] != null) {
      userCommentCnt = int.parse(json['usercommentcount'].toString());
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
