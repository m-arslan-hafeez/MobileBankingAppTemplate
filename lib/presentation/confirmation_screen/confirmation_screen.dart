import 'models/confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';
import 'provider/confirmation_provider.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  ConfirmationScreenState createState() => ConfirmationScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ConfirmationProvider(),
        child: ConfirmationScreen());
  }
}

class ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("lbl_confirmation".tr,
                          style: CustomTextStyles.titleMediumSemiBold18),
                      SizedBox(height: 70.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgIllustrationGray100,
                          height: 200.v,
                          width: 143.h),
                      SizedBox(height: 70.v),
                      CustomElevatedButton(
                          text: "lbl_back_home".tr,
                          onPressed: () {
                            onTapBackHome(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapBackHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.minePageContainerScreen,
    );
  }
}
