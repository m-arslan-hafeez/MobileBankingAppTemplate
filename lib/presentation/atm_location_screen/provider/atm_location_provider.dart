import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/atm_location_screen/models/atm_location_model.dart';

/// A provider class for the AtmLocationScreen.
///
/// This provider manages the state of the AtmLocationScreen, including the
/// current atmLocationModelObj

// ignore_for_file: must_be_immutable
class AtmLocationProvider extends ChangeNotifier {
  AtmLocationModel atmLocationModelObj = AtmLocationModel();

  @override
  void dispose() {
    super.dispose();
  }
}
