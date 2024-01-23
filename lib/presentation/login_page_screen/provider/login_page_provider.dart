import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/login_page_screen/models/login_page_model.dart';

/// A provider class for the LoginPageScreen.
///
/// This provider manages the state of the LoginPageScreen, including the
/// current loginPageModelObj

// ignore_for_file: must_be_immutable
class LoginPageProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordFloatingTextFieldController =
      TextEditingController();

  LoginPageModel loginPageModelObj = LoginPageModel();

  bool isShowPassword = true;

  bool rememberme = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordFloatingTextFieldController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    rememberme = value;
    notifyListeners();
  }
}
