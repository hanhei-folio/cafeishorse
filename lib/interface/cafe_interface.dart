import 'package:fetching_data/manager/dio_manager/dio_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';

class CafeInterface {
  static Future<List<CafeModel>> get(
      List<String> pickedKeywords, String pickedDistance) async {
    // TODO 선택한 키워드와 거리 정보를 전달하기
    var resBody = await DioManager().get('/quiz/cafe?count=100');

    List<CafeModel> ret = [];

    if (resBody['data'] != null) {
      for (var e in resBody['data']) {
        ret.add(CafeModel.fromJson(e));
      }
    }

    return ret;
  }
}
