import 'models/verify_email_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';
import 'package:m_s_application/widgets/custom_pin_code_text_field.dart';
import 'provider/verify_email_provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VerifyEmailProvider(), child: VerifyEmailScreen());
  }
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 86.v, right: 24.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup204,
                      height: 154.v,
                      width: 280.h),
                  SizedBox(height: 69.v),
                  Text("msg_verify_your_email".tr,
                      style: CustomTextStyles.titleLargeSemiBold_1),
                  SizedBox(height: 18.v),
                  SizedBox(
                      width: 226.h,
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_please_enter_4_digit2".tr,
                                style: CustomTextStyles.titleSmallff9494a2),
                            TextSpan(
                                text: "lbl_xyz_gmail_com".tr,
                                style: CustomTextStyles.titleSmallff8982ff)
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 25.v),
                  Padding(
                      padding: EdgeInsets.only(left: 48.h, right: 49.h),
                      child:
                          Selector<VerifyEmailProvider, TextEditingController?>(
                              selector: (context, provider) =>
                                  provider.otpController,
                              builder: (context, otpController, child) {
                                return CustomPinCodeTextField(
                                    context: context,
                                    controller: otpController,
                                    onChanged: (value) {
                                      otpController?.text = value;
                                    });
                              })),
                  SizedBox(height: 14.v),
                  Text("lbl_resend_code".tr,
                      style: CustomTextStyles.bodyMediumPrimary),
                  SizedBox(width: 92.h, child: Divider()),
                  SizedBox(height: 19.v),
                  CustomElevatedButton(
                      text: "lbl_verify_code".tr,
                      onPressed: () {
                        onTapVerifyCode(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 59.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftBlack900,
            margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapVerifyCode(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.minePageContainerScreen,
    );
  }
}
