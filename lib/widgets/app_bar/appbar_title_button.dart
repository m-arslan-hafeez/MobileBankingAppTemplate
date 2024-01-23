import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: 40.v,
          width: 80.h,
          text: "lbl_login".tr,
          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700_1,
        ),
      ),
    );
  }
}
