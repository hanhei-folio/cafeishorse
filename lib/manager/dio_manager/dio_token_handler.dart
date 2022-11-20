import 'package:dio/dio.dart';

/// handling access token (in future) -> DioManager doesn't care about token.
class DioTokenHandler extends Interceptor {
  final Dio dio;
  DioTokenHandler(this.dio);

  // TODO : https://medium.com/dreamwod-tech/flutter-dio-framework-best-practices-668985fc75b7
}