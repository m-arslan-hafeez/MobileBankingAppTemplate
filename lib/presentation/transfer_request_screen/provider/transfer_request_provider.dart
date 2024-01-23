import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/transfer_request_screen/models/transfer_request_model.dart';
import '../models/transferrequest_item_model.dart';

/// A provider class for the TransferRequestScreen.
///
/// This provider manages the state of the TransferRequestScreen, including the
/// current transferRequestModelObj

// ignore_for_file: must_be_immutable
class TransferRequestProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  TransferRequestModel transferRequestModelObj = TransferRequestModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
