import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('오류가 발생했습니다.'),
    );
  }
}
