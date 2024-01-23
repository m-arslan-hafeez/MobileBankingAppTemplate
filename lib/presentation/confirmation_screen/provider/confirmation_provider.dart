import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/confirmation_screen/models/confirmation_model.dart';

/// A provider class for the ConfirmationScreen.
///
/// This provider manages the state of the ConfirmationScreen, including the
/// current confirmationModelObj

// ignore_for_file: must_be_immutable
class ConfirmationProvider extends ChangeNotifier {
  ConfirmationModel confirmationModelObj = ConfirmationModel();

  @override
  void dispose() {
    super.dispose();
  }
}
