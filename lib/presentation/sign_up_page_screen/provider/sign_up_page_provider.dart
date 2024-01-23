import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/sign_up_page_screen/models/sign_up_page_model.dart';

/// A provider class for the SignUpPageScreen.
///
/// This provider manages the state of the SignUpPageScreen, including the
/// current signUpPageModelObj

// ignore_for_file: must_be_immutable
class SignUpPageProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController checkmarkController = TextEditingController();

  TextEditingController passwordFloatingTextFieldController =
      TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  SignUpPageModel signUpPageModelObj = SignUpPageModel();

  bool isShowPassword = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    checkmarkController.dispose();
    passwordFloatingTextFieldController.dispose();
    confirmpasswordController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in signUpPageModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in signUpPageModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
