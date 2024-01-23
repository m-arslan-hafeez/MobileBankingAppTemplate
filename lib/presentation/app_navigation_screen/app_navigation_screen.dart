import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:m_s_application/core/app_export.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Verify Email".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verifyEmailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Country or Region ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.countryOrRegionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Mine Page - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.minePageContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Transfer - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.transferTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Send Money".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sendMoneyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Currency Exchange".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.currencyExchangeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Transfer Amount".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.transferAmountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Confirmation".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.confirmationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Transfer Request".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.transferRequestScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "History".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.historyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ATM Location".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.atmLocationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
