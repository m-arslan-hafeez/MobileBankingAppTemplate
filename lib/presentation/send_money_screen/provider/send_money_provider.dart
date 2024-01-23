import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/send_money_screen/models/send_money_model.dart';

/// A provider class for the SendMoneyScreen.
///
/// This provider manages the state of the SendMoneyScreen, including the
/// current sendMoneyModelObj

// ignore_for_file: must_be_immutable
class SendMoneyProvider extends ChangeNotifier {
  SendMoneyModel sendMoneyModelObj = SendMoneyModel();

  @override
  void dispose() {
    super.dispose();
  }

  onSelected(dynamic value) {
    for (var element in sendMoneyModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
