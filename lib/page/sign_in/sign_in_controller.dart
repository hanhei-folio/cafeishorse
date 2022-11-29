import 'package:email_validator/email_validator.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/manager/toast_manager.dart';
import 'package:fetching_data/manager/user_info_holder.dart';
import 'package:fetching_data/page/sign_up/sign_up.dart';
import 'package:fetching_data/widget/loading_widget.dart';
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

    late BuildContext loadingWidgetContext;
    showDialog(
        context: context,
        builder: (cont) {
          loadingWidgetContext = cont;
          return LoadingWidget();
        });
    try {
      int loginResult = await UserInterface.checkLoginVaildate(email, password);
      if (loginResult == 1) {
        Navigator.pop(loadingWidgetContext);
        ToastManager.toastInfo('잘못된 이메일 또는 비밀번호입니다. 다시 입력해주세요.');
        return;
      }

      if (loginResult == 2) {
        Navigator.pop(loadingWidgetContext);
        ToastManager.toastInfo('통신 중 에러가 발생했습니다.');
        return;
      }

      if (loginResult == 0) {
        Navigator.pop(loadingWidgetContext);
        UserInfoHolder.email = email;
        NavigatorManager.pushReplaceAll(context, (context) => const Home());
      }
    } catch (e, s) {
      print(e);
      print(s);
      Navigator.pop(loadingWidgetContext);
    }
  }

  void onRegisterButtonClicked() {
    NavigatorManager.push(context, (context) => const SignUp());
  }
}
