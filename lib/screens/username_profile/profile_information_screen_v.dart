import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/device/device_service.dart';
import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/screens/username_profile/profile_information_screen_m.dart';
import 'package:chef/screens/username_profile/profile_information_screen_vm.dart';

class ProfileInformationScreen
    extends BaseView<ProfileInformationScreenViewModel> {
  ProfileInformationScreen({Key? key}) : super(key: key);

  static const _primarySize = 48.0;
  static const _secondarySize = 16.0;
  static const _rightPadding = 98.0;
  static const _topPadding = 66.0;
  static const _textFieldTopPadding = 4.0;
  static const _titleTopPadding = 33.0;
  static const _titleBottomPadding = 53.0;
  static const _textOpacity = 0.3;
  static const _zeroValue = 0.0;
  static const _textFieldcontentPadding = 22.0;
  static const _textFieldHeight = 56.0;

  final _nameController = TextController();

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<ProfileInformationScreenViewModel,
        ProfileInformationScreenState>(
      bloc: viewModel..fetchUserData(),
      builder: (context, state) {
        return (screenSizeData.screenType == ScreenType.small)
            ? _buildMobileView(
                context: context,
                appTheme: appTheme,
                screenSizeData: screenSizeData,
                state: state,
              )
            : _buildTabletView(
                context: context,
                appTheme: appTheme,
                screenSizeData: screenSizeData,
                state: state,
              );
      },
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required IAppThemeData appTheme,
    required ScreenSizeData screenSizeData,
    required ProfileInformationScreenState state,
  }) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: _titleTopPadding,
            ),
            GeneralProfileAppBar(
              title: Strings.name,
              onClick: () => viewModel.pop(),
            ),
            const SizedBox(
              height: _titleBottomPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _secondarySize),
              child: _mainBody(
                context: context,
                appTheme: appTheme,
                screenSizeData: screenSizeData,
                state: state,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required IAppThemeData appTheme,
    required ScreenSizeData screenSizeData,
    required ProfileInformationScreenState state,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _primarySize,
        right: _rightPadding,
        top: _topPadding,
      ),
      child: _mainBody(
        context: context,
        appTheme: appTheme,
        screenSizeData: screenSizeData,
        state: state,
      ),
    );
  }

  Widget _mainBody({
    required BuildContext context,
    required IAppThemeData appTheme,
    required ScreenSizeData screenSizeData,
    required ProfileInformationScreenState state,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.firstNameLastName,
          color: appTheme.colors.mainBlack100,
          typography: TypographyFamily.label2,
        ),
        const SizedBox(
          height: _textFieldTopPadding,
        ),
        GeneralTextInput(
          controller: _nameController,
          height: _textFieldHeight,
          contentPadding: const EdgeInsets.symmetric(
            vertical: _textFieldcontentPadding,
            horizontal: _textFieldcontentPadding,
          ),
          backgroundColor: appTheme.colors.tertiaryBackground,
          hint: state.user?.fullname ?? '',
          hintStyle: appTheme.typographies.interFontFamily.body2R.copyWith(
            color: appTheme.colors.mainBlack100,
          ),
          inputBorder: appTheme.searchbarBorder,
        ),
        const SizedBox(
          height: _secondarySize,
        ),
        GeneralButton(
          width: screenSizeData.size.width,
          height: _primarySize,
          buttonType: ButtonType.button,
          onTap: () {},
          isEnable: true,
          title: Strings.confirm,
          textStyle: appTheme.getTextStyle(
            typographyFamily: TypographyFamily.label2,
            color: appTheme.colors.primary.withOpacity(_textOpacity),
          ),
          style: ElevatedButton.styleFrom(
            primary: appTheme.colors.tertiaryBackground,
            elevation: _zeroValue,
          ),
          isBusy: false,
        ),
      ],
    );
  }
}
