import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/presentation/mine_page_container_screen/models/mine_page_container_model.dart';

/// A provider class for the MinePageContainerScreen.
///
/// This provider manages the state of the MinePageContainerScreen, including the
/// current minePageContainerModelObj

// ignore_for_file: must_be_immutable
class MinePageContainerProvider extends ChangeNotifier {
  MinePageContainerModel minePageContainerModelObj = MinePageContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
