import '../transfer_request_screen/widgets/transferrequest_item_widget.dart';
import 'models/transfer_request_model.dart';
import 'models/transferrequest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:m_s_application/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:m_s_application/widgets/custom_elevated_button.dart';
import 'package:m_s_application/widgets/custom_icon_button.dart';
import 'package:m_s_application/widgets/custom_search_view.dart';
import 'provider/transfer_request_provider.dart';

class TransferRequestScreen extends StatefulWidget {
  const TransferRequestScreen({Key? key}) : super(key: key);

  @override
  TransferRequestScreenState createState() => TransferRequestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TransferRequestProvider(),
        child: TransferRequestScreen());
  }
}

class TransferRequestScreenState extends State<TransferRequestScreen> {
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
                padding: EdgeInsets.all(24.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildThirtyThree(context),
                      SizedBox(height: 20.v),
                      Selector<TransferRequestProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "lbl_search_people".tr);
                          }),
                      SizedBox(height: 26.v),
                      Text("lbl_contact_people".tr,
                          style: CustomTextStyles.titleMediumSemiBold),
                      SizedBox(height: 13.v),
                      _buildTransferRequest(context)
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
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_transfer_request".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildThirtyThree(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomElevatedButton(
          height: 40.v,
          width: 125.h,
          text: "lbl_transfer".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 9.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgClose1,
                  height: 14.adaptSize,
                  width: 14.adaptSize)),
          buttonStyle: CustomButtonStyles.fillIndigoA,
          buttonTextStyle: CustomTextStyles.titleSmallWhiteA700),
      CustomElevatedButton(
          height: 40.v,
          width: 125.h,
          text: "lbl_request".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgClose2,
                  height: 14.adaptSize,
                  width: 14.adaptSize)),
          buttonStyle: CustomButtonStyles.fillGreen,
          buttonTextStyle: CustomTextStyles.titleSmallWhiteA700),
      CustomIconButton(
          height: 40.adaptSize,
          width: 40.adaptSize,
          padding: EdgeInsets.all(10.h),
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(imagePath: ImageConstant.imgMore))
    ]);
  }

  /// Section Widget
  Widget _buildTransferRequest(BuildContext context) {
    return Consumer<TransferRequestProvider>(
        builder: (context, provider, child) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount:
              provider.transferRequestModelObj.transferrequestItemList.length,
          itemBuilder: (context, index) {
            TransferrequestItemModel model =
                provider.transferRequestModelObj.transferrequestItemList[index];
            return TransferrequestItemWidget(model);
          });
    });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
