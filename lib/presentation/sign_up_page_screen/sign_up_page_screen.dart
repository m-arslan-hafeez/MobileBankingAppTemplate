import 'models/sign_up_page_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/core/utils/validation_functions.dart';
import 'package:m_s_application/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:m_s_application/widgets/app_bar/appbar_title_button_one.dart';
import 'package:m_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:m_s_application/widgets/custom_drop_down.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';
import 'package:m_s_application/widgets/custom_floating_text_field.dart';
import 'package:m_s_application/widgets/custom_text_form_field.dart';
import 'provider/sign_up_page_provider.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  SignUpPageScreenState createState() => SignUpPageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpPageProvider(), child: SignUpPageScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignUpPageScreenState extends State<SignUpPageScreen> {
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
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildNameInputField(context),
                                  SizedBox(height: 22.v),
                                  _buildEmailInputField(context),
                                  SizedBox(height: 23.v),
                                  _buildPhoneInputField(context),
                                  SizedBox(height: 23.v),
                                  _buildPasswordFloatingTextField(context),
                                  SizedBox(height: 22.v),
                                  _buildConfirmPasswordInputField(context),
                                  SizedBox(height: 22.v),
                                  _buildDateRow(context),
                                  SizedBox(height: 23.v),
                                  _buildSignUpButton(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildFrameTwoRow(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 56.v,
        title: Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Row(children: [
              AppbarSubtitleOne(
                  text: "lbl_login".tr,
                  margin: EdgeInsets.only(top: 9.v, bottom: 6.v),
                  onTap: () {
                    onTapLogin(context);
                  }),
              AppbarTitleButtonOne(margin: EdgeInsets.only(left: 18.h))
            ])));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Selector<SignUpPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.nameController,
        builder: (context, nameController, child) {
          return CustomTextFormField(
              controller: nameController,
              hintText: "msg_dmitry_ponomarev".tr,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 4.v, bottom: 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 27.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildNameInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_name".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      _buildName(context)
    ]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignUpPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_xyz_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildEmailInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      SizedBox(height: 1.v),
      _buildEmail(context)
    ]);
  }

  /// Section Widget
  Widget _buildCheckmark(BuildContext context) {
    return Selector<SignUpPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.checkmarkController,
        builder: (context, checkmarkController, child) {
          return CustomTextFormField(
              width: 326.h,
              controller: checkmarkController,
              hintText: "lbl_1_123_456_7890".tr,
              alignment: Alignment.bottomCenter,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 5.v, bottom: 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 28.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildPhoneInputField(BuildContext context) {
    return SizedBox(
        height: 51.v,
        width: 327.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          _buildCheckmark(context),
          Align(
              alignment: Alignment.topLeft,
              child: Text("lbl_phone".tr,
                  style: CustomTextStyles.titleMediumSecondaryContainer_1))
        ]));
  }

  /// Section Widget
  Widget _buildPasswordFloatingTextField(BuildContext context) {
    return Consumer<SignUpPageProvider>(builder: (context, provider, child) {
      return CustomFloatingTextField(
          controller: provider.passwordFloatingTextFieldController,
          labelText: "lbl_password".tr,
          labelStyle: theme.textTheme.bodyMedium!,
          hintText: "lbl_password".tr,
          textInputType: TextInputType.visiblePassword,
          obscureText: provider.isShowPassword,
          suffix: InkWell(
              onTap: () {
                provider.changePasswordVisibility();
              },
              child: SizedBox(
                  child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 10.v,
                      width: 16.h))),
          suffixConstraints: BoxConstraints(maxHeight: 51.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          });
    });
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Selector<SignUpPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.confirmpasswordController,
        builder: (context, confirmpasswordController, child) {
          return CustomTextFormField(
              controller: confirmpasswordController,
              hintText: "lbl_xyz123".tr,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 3.v, bottom: 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 10.v,
                      width: 16.h)),
              suffixConstraints: BoxConstraints(maxHeight: 26.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildConfirmPasswordInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      SizedBox(height: 1.v),
      _buildConfirmpassword(context)
    ]);
  }

  /// Section Widget
  Widget _buildDateRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 52.v,
          width: 155.h,
          child: Stack(alignment: Alignment.topLeft, children: [
            Selector<SignUpPageProvider, SignUpPageModel?>(
                selector: (context, provider) => provider.signUpPageModelObj,
                builder: (context, signUpPageModelObj, child) {
                  return CustomDropDown(
                      width: 153.h,
                      hintText: "lbl_20_jan_1998".tr,
                      alignment: Alignment.bottomCenter,
                      items: signUpPageModelObj?.dropdownItemList ?? [],
                      onChanged: (value) {
                        context.read<SignUpPageProvider>().onSelected(value);
                      });
                }),
            Align(
                alignment: Alignment.topLeft,
                child: Text("lbl_date_of_birth".tr,
                    style: CustomTextStyles.titleMediumSecondaryContainer_1))
          ])),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("lbl_country_region".tr,
            style: CustomTextStyles.titleMediumSecondaryContainer_1),
        Selector<SignUpPageProvider, SignUpPageModel?>(
            selector: (context, provider) => provider.signUpPageModelObj,
            builder: (context, signUpPageModelObj, child) {
              return CustomDropDown(
                  width: 156.h,
                  hintText: "lbl_united_states".tr,
                  items: signUpPageModelObj?.dropdownItemList1 ?? [],
                  onChanged: (value) {
                    context.read<SignUpPageProvider>().onSelected1(value);
                  });
            })
      ])
    ]);
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          onTapSignUpButton(context);
        });
  }

  /// Section Widget
  Widget _buildFrameTwoRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 51.h, right: 51.h, bottom: 29.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("msg_already_have_an".tr,
              style: CustomTextStyles.titleMediumGray500),
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: Text("lbl_sign_in".tr,
                  style: CustomTextStyles.titleMediumPrimary))
        ]));
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }

  /// Navigates to the countryOrRegionScreen when the action is triggered.
  onTapSignUpButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.countryOrRegionScreen,
    );
  }
}
