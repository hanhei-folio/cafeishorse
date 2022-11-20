import 'package:email_validator/email_validator.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/manager/toast_manager.dart';
import 'package:fetching_data/page/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../../interface/user_interface.dart';
import '../home/home.dart';

class SignInController {
  SignInController(this.context, this.refresh);

  BuildContext context;
  VoidCallback refresh;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // TODO
  Future<void> signIn() async {
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

    int loginResult = await UserInterface.checkLoginVaildate(email,password);
    if (loginResult == 1) {
      ToastManager.toastInfo('잘못된 이메일 또는 비밀번호입니다. 다시 입력해주세요.');
      return;
    }

    if (loginResult == 2) {
      ToastManager.toastInfo('통신 중 에러가 발생했습니다.');
      return;
    }

    if(loginResult==0) {
      NavigatorManager.push(context, (context) => const Home());
    }
    // 서버 통신

    // 결과 1) 로그인 성공, 홈화면으로 진입

    // 결과 2) 로그인 실패, 알림
  }

  void onRegisterButtonClicked() {
    NavigatorManager.push(context, (context) => const SignUp());
  }
}