import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/transfer_tab_container_screen/models/transfer_tab_container_model.dart';
import '../models/transfertabcontainer_item_model.dart';

/// A provider class for the TransferTabContainerScreen.
///
/// This provider manages the state of the TransferTabContainerScreen, including the
/// current transferTabContainerModelObj

// ignore_for_file: must_be_immutable
class TransferTabContainerProvider extends ChangeNotifier {
  TransferTabContainerModel transferTabContainerModelObj =
      TransferTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
