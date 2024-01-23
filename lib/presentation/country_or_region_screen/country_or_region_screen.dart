import '../country_or_region_screen/widgets/countryorregion_item_widget.dart';
import 'models/country_or_region_model.dart';
import 'models/countryorregion_item_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'package:m_s_application/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:m_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:m_s_application/widgets/custom_search_view.dart';
import 'provider/country_or_region_provider.dart';

class CountryOrRegionScreen extends StatefulWidget {
  const CountryOrRegionScreen({Key? key}) : super(key: key);

  @override
  CountryOrRegionScreenState createState() => CountryOrRegionScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CountryOrRegionProvider(),
        child: CountryOrRegionScreen());
  }
}

class CountryOrRegionScreenState extends State<CountryOrRegionScreen> {
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
                      Selector<CountryOrRegionProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_country".tr);
                          }),
                      SizedBox(height: 31.v),
                      Text("msg_country_or_region".tr,
                          style: CustomTextStyles.titleMediumSemiBold18),
                      SizedBox(height: 14.v),
                      _buildCountryOrRegion(context)
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

  /// Section Widget
  Widget _buildCountryOrRegion(BuildContext context) {
    return Consumer<CountryOrRegionProvider>(
        builder: (context, provider, child) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount:
              provider.countryOrRegionModelObj.countryorregionItemList.length,
          itemBuilder: (context, index) {
            CountryorregionItemModel model =
                provider.countryOrRegionModelObj.countryorregionItemList[index];
            return CountryorregionItemWidget(model, onTapCountrySelection: () {
              onTapCountrySelection(context);
            });
          });
    });
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapCountrySelection(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.minePageContainerScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
