import 'package:fetching_data/manager/dio_manager/dio_manager.dart';
import 'package:fetching_data/manager/user_info_holder.dart';
import 'package:fetching_data/model/cafe_model.dart';

class CafeInterface {
  static Future<List<CafeModel>> get(
      List<String> pickedKeywords, String pickedDistance) async {
    // TODO 선택한 키워드와 거리 정보를 전달하기
    var resBody = await DioManager().get('/quiz/cafe', query: {
      'count': '10'
    });

    List<CafeModel> ret = [];

    if (resBody['data'] != null) {
      for (var e in resBody['data']) {
        ret.add(CafeModel.fromJson(e));
      }
    }

    return ret;
  }

  static Future<bool?> getLike(int cafeId) async {
    String? email = UserInfoHolder.email;
    if (email == null) return null;

    try {
      var resBody = await DioManager().get('/quiz/cafe/bookmark/is', query: {
        'email': email,
        'id': cafeId,
      });

      return resBody['message'].toString().toUpperCase() == 'SUCCESS';
    } catch (e) {}
    return null;
  }

  static Future<void> pushLikeButton(int cafeId, bool currentLikeStatus) async {
    String? email = UserInfoHolder.email;
    if (email == null) {
      print('error: pushLikeButton, email is null');
      return;
    }

    if (currentLikeStatus) {
      String path = '/quiz/cafe/bookmark/disable';
      await DioManager().delete(path, query: {
        'email': email,
        'id': cafeId.toString()
      });
    } else {
      String path = '/quiz/cafe/bookmark/enable';
      await DioManager().put(path, query: {
        'email': email,
        'id': cafeId.toString()
      });
    }
  }
}
