import 'package:dio/dio.dart';
import 'package:fetching_data/constant/constants.dart';
import 'package:fetching_data/manager/dio_manager/dio_error_handler.dart';
import 'package:fetching_data/manager/dio_manager/dio_token_handler.dart';

class DioManager {
  DioManager._constructor();

  static DioManager _instance = DioManager._constructor();

  factory DioManager() => _instance;

  Dio _dio = _createDio();

  static Dio _createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://' + host,
      receiveTimeout: 300000,
      connectTimeout: 150000,
      sendTimeout: 150000,
    ));

    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioTokenHandler(dio));
    dio.interceptors.add(DioErrorHandler(dio));

    return dio;
  }

  void setToken(String token) {
    Map<String, String> header = {'Authorization': 'Token ${token}'};
    _dio.options.headers = header;
  }

  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic> query = const {}}) async {
    var response = await _dio.get(path, queryParameters: query);
    return response.data;
  }

  Future<dynamic> put(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.put(path, queryParameters: query, data: requestBody);
    return response.data;
  }

  Future<dynamic> delete(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.delete(path, queryParameters: query, data: requestBody);
    return response.data;
  }

  Future<dynamic> post(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.post(path, queryParameters: query, data: requestBody);
    return response.data;
  }

  Future<dynamic> postFormUrlEncoded(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    var response =
        await _dio.post(path, queryParameters: query, data: requestBody);
    _dio.options.contentType = Headers.jsonContentType;
    return response.data;
  }

  /// how to make FormData link : https://dkswnkk.tistory.com/334
  /// var formData = FormData.fromMap({'image': await MultipartFile.fromBytes(bytes, filename: 'filename')});
  Future<dynamic> postMultiPartFormData(String path,
      {Map<String, dynamic> query = const {},
      required FormData formData}) async {
    _dio.options.contentType = 'multipart/form-data';
    try {
      var response =
          await _dio.post(path, queryParameters: query, data: formData);
      _dio.options.contentType = Headers.jsonContentType;
      return response.data;
    } catch (e) {
      _dio.options.contentType = Headers.jsonContentType;
      return null;
    }
  }
}
