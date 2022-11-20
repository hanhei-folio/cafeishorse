import 'package:fetching_data/manager/dio_manager/dio_manager.dart';

class UserInterface {
  // return 0 : 중복 아님, 1 : 중복임, 2 : 통신 중 에러 발생
  static Future<int> checkEmailDuplicated(String email) async {
    try {
      var resBody = await DioManager()
          .get('/login/sign_up/double_check', query: {'email': email});


      if (resBody['message'].toString() == 'Success') {
        return 0;
      } else if (resBody['message'].toString() == 'Fail') {
        return 1;
      }
    } catch (e, s) {
      print(e);
      print(s);
      return 2;
    }

    return 2;
  }

  // return 0 : 성공, 1 : 실패
  static Future<int> signUp(String email, String password) async {
    try {
      var resBody = await DioManager()
          .get('/login/sign_up/double_check', query: {'email': email});
//           .get('/user', query: {'email': email});

      if (resBody['message'].toString() == 'Success') {
        var postResBody=await DioManager().post('/login/sign_up/register',requestBody: {'email':email,'password':password});


        return 0;
      } else if (resBody['message'].toString() == 'Fail') {
        return 1;
      }
    } catch (e, s) {
      print(e);
      print(s);
      return 1;
    }

    return 1;
  }


  static Future<int> checkLoginVaildate(String email,String password) async {
    try {
      var resBody = await DioManager()
          .get('/login/login', query: {'email': email,'password':password});


      if (resBody['message'].toString() == 'Success') {
        return 0;
      } else if (resBody['message'].toString() == 'Fail') {
        return 1;
      }
    } catch (e, s) {
      print(e);
      print(s);
      return 2;
    }

    return 2;
  }




}
