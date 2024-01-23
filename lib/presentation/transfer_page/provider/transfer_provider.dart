import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/transfer_page/models/transfer_model.dart';

/// A provider class for the TransferPage.
///
/// This provider manages the state of the TransferPage, including the
/// current transferModelObj

// ignore_for_file: must_be_immutable
class TransferProvider extends ChangeNotifier {
  TransferModel transferModelObj = TransferModel();

  @override
  void dispose() {
    super.dispose();
  }
}
