import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/statistics_tab_container_page/models/statistics_tab_container_model.dart';

/// A provider class for the StatisticsTabContainerPage.
///
/// This provider manages the state of the StatisticsTabContainerPage, including the
/// current statisticsTabContainerModelObj

// ignore_for_file: must_be_immutable
class StatisticsTabContainerProvider extends ChangeNotifier {
  StatisticsTabContainerModel statisticsTabContainerModelObj =
      StatisticsTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }

  onSelected(dynamic value) {
    for (var element in statisticsTabContainerModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
