import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/transfer_amount_screen/models/transfer_amount_model.dart';

/// A provider class for the TransferAmountScreen.
///
/// This provider manages the state of the TransferAmountScreen, including the
/// current transferAmountModelObj

// ignore_for_file: must_be_immutable
class TransferAmountProvider extends ChangeNotifier {
  TransferAmountModel transferAmountModelObj = TransferAmountModel();

  @override
  void dispose() {
    super.dispose();
  }
}
