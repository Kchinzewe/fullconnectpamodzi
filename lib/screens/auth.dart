import 'package:connectv01pamodzi/widget/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:connectv01pamodzi/widget/login_widget.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;

  void toggle() => setState(() {
        isLogin = !isLogin;
  });

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(onClickedSignUp: toggle)
        : SignUpWidget(onClickedSignIn: toggle);

    ;
  }
}
