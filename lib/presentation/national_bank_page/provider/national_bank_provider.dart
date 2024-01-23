import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/national_bank_page/models/national_bank_model.dart';

/// A provider class for the NationalBankPage.
///
/// This provider manages the state of the NationalBankPage, including the
/// current nationalBankModelObj

// ignore_for_file: must_be_immutable
class NationalBankProvider extends ChangeNotifier {
  NationalBankModel nationalBankModelObj = NationalBankModel();

  @override
  void dispose() {
    super.dispose();
  }
}
