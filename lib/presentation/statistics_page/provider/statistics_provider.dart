import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/statistics_page/models/statistics_model.dart';

/// A provider class for the StatisticsPage.
///
/// This provider manages the state of the StatisticsPage, including the
/// current statisticsModelObj
class StatisticsProvider extends ChangeNotifier {
  StatisticsModel statisticsModelObj = StatisticsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
