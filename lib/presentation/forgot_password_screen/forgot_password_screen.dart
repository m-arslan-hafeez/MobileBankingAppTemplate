import 'models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/core/utils/validation_functions.dart';
import 'package:m_s_application/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';
import 'package:m_s_application/widgets/custom_text_form_field.dart';
import 'provider/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ForgotPasswordProvider(),
        child: ForgotPasswordScreen());
  }
}

// ignore_for_file: must_be_immutable
class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 59.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgGroup205,
                                  height: 210.v,
                                  width: 280.h),
                              SizedBox(height: 41.v),
                              Text("lbl_forget_password".tr,
                                  style: CustomTextStyles.titleLargeSemiBold_1),
                              SizedBox(height: 17.v),
                              Container(
                                  width: 245.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 41.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_please_enter_your2".tr,
                                            style: CustomTextStyles
                                                .titleSmallff9494a2
                                                .copyWith(height: 1.50)),
                                        TextSpan(
                                            text: "msg_verification_code".tr,
                                            style: CustomTextStyles
                                                .titleSmallff8982ff)
                                      ]),
                                      textAlign: TextAlign.center)),
                              SizedBox(height: 23.v),
                              Selector<ForgotPasswordProvider,
                                      TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.emailController,
                                  builder: (context, emailController, child) {
                                    return CustomTextFormField(
                                        controller: emailController,
                                        hintText: "lbl_xyz_gmail_com".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "err_msg_please_enter_valid_email"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineGray);
                                  }),
                              SizedBox(height: 20.v),
                              CustomElevatedButton(
                                  text: "lbl_send_email".tr,
                                  onPressed: () {
                                    onTapSendEmail(context);
                                  }),
                              SizedBox(height: 5.v)
                            ])))))));
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

  /// Navigates to the verifyEmailScreen when the action is triggered.
  onTapSendEmail(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verifyEmailScreen,
    );
  }
}
