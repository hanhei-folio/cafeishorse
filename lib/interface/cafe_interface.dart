import 'package:fetching_data/manager/dio_manager/dio_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';


class CafeInterface {
  static Future<List<CafeModel>> getCafes() async {
    var resBody = await DioManager().get('/quiz/cafe?count=7');

    List<CafeModel> list = (resBody['data'] as List<dynamic>).map((e) => CafeModel.fromJson(
      e as Map<String,dynamic>)).toList();
    // for(var e in resBody){
    //   CafeModel.fromJson(e);
    // }
    // return CafeModel.fromJson(resBody[0]);
    return list;
  }
}