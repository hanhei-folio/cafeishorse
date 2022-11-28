import 'package:fetching_data/manager/dio_manager/dio_manager.dart';
import 'package:fetching_data/model/review_model.dart';

class ReviewInterface {
  static Future<List<ReviewModel>> get(int cafeId) async {
    var resBody = await DioManager().get('/quiz/review', query: {
      'id': cafeId.toString(),
      'count': '10'   // TODO 가져오는 개수 조정
    });

    List<ReviewModel> ret = [];

    if (resBody['data'] != null) {
      for (var e in resBody['data']) {
        ret.add(ReviewModel.fromJson(e));
      }
    }

    return ret;
  }
}