import 'package:email_validator/email_validator.dart';
import 'package:fetching_data/interface/user_interface.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/manager/toast_manager.dart';
import 'package:fetching_data/page/sign_in/sign_in.dart';
import 'package:fetching_data/widget/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpController {
  SignUpController(this.context, this.refresh);

  BuildContext context;
  VoidCallback refresh;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> trySignUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ToastManager.toastInfo('이메일과 비밀번호를 입력해주세요.');
      return;
    }

    bool isEmailValidated = EmailValidator.validate(email);

    if (!isEmailValidated) {
      ToastManager.toastInfo('이메일을 형식에 맞게 입력해주세요.');
      return;
    }

    late BuildContext loadingWidgetContext;
    showDialog(
        context: context,
        builder: (cont) {
          loadingWidgetContext = cont;
          return LoadingWidget();
        });
    try {
      // return 0 : 중복 아님, 1 : 중복임, 2 : 통신 중 에러 발생
      int emailDuplicatedResult = await UserInterface.checkEmailDuplicated(email);

      if (emailDuplicatedResult == 1) {
        Navigator.pop(loadingWidgetContext);
        ToastManager.toastInfo('이미 존재하는 이메일입니다.');
        return;
      }

      if (emailDuplicatedResult == 2) {
        Navigator.pop(loadingWidgetContext);
        ToastManager.toastInfo('통신 중 에러가 발생했습니다.');
        return;
      }

      // return 0 : 성공, 1 : 실패
      int signUpSucceed = await UserInterface.signUp(email, password);
      if (signUpSucceed == 1) {
        Navigator.pop(loadingWidgetContext);
        ToastManager.toastInfo('회원가입에 실패했습니다.');
        return;
      }


      ToastManager.toastInfo('회원가입에 성공하였습니다.');

      Navigator.pop(loadingWidgetContext);
      NavigatorManager.pushReplaceAll(context, (context) => SignIn());
    } catch (e, s) {
      print(e);
      print(s);
      Navigator.pop(loadingWidgetContext);
    }
  }
}