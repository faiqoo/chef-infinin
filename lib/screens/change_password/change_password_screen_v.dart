import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef/base/base_view.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/services.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/screens/change_password/change_password_screen_m.dart';
import 'package:chef/screens/change_password/change_password_screen_vm.dart';

class ChangePasswordScreen extends BaseView<ChangePasswordScreenViewModel> {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final _mobilePadding = 16.0;
  final _tabLeftPadding = 48.0;
  final _tabRightPadding = 98.0;
  final _size8 = 8.0;
  final _size20 = 20.0;
  final _size24 = 24.0;
  final _size36 = 36.0;

  final _opacity = 0.32;

  final TextController _passwordController = TextController();
  final TextController _newPasswordController = TextController();
  final TextController _confirmPasswordController = TextController();

  static const _appBarPadding = 33.0;

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<ChangePasswordScreenViewModel,
        ChangePasswordScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.colors.secondaryBackground,
            body: screenSizeData.screenType == ScreenType.small
                ? _mobileView(
                    appTheme: appTheme,
                    state: state,
                  )
                : _tabletView(
                    appTheme: appTheme,
                    state: state,
                  ),
          ),
        );
      },
    );
  }

  Widget _mobileView({
    required IAppThemeData appTheme,
    required ChangePasswordScreenState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _appBarPadding,
        ),
        GeneralProfileAppBar(
          title: Strings.changePassword,
          onClick: () => viewModel.pop(),
        ),
        const SizedBox(
          height: _appBarPadding,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(_mobilePadding),
            child: SingleChildScrollView(
              child: _form(
                appTheme: appTheme,
                state: state,
                hintStyle:
                    appTheme.typographies.interFontFamily.body2M.copyWith(
                  color: appTheme.colors.primary.withOpacity(_opacity),
                ),
                valueStyle: appTheme.typographies.interFontFamily.body2M
                    .copyWith(color: appTheme.colors.primary),
              ),
            ),
          ),
        ),
        SizedBox(
          height: _size8,
        ),
        Padding(
          padding: EdgeInsets.all(_mobilePadding),
          child: _button(appTheme: appTheme),
        )
      ],
    );
  }

  Widget _tabletView({
    required IAppThemeData appTheme,
    required ChangePasswordScreenState state,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: _tabLeftPadding,
          top: _tabLeftPadding,
          right: _tabRightPadding,
        ),
        child: Column(
          children: [
            _form(
              appTheme: appTheme,
              state: state,
              hintStyle: appTheme.typographies.interFontFamily.body1.copyWith(
                color: appTheme.colors.primary.withOpacity(_opacity),
              ),
              valueStyle: appTheme.typographies.interFontFamily.body1
                  .copyWith(color: appTheme.colors.primary),
              isTablet: true,
            ),
            SizedBox(
              height: _size36,
            ),
            _button(appTheme: appTheme, isTablet: true),
          ],
        ),
      ),
    );
  }

  Widget _form({
    required IAppThemeData appTheme,
    required ChangePasswordScreenState state,
    required TextStyle hintStyle,
    required TextStyle valueStyle,
    bool isTablet = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GeneralText(
          Strings.currentPassword,
          typography: TypographyFamily.label2,
        ),
        SizedBox(
          height: _size8,
        ),
        GeneralTextInput(
          controller: _passwordController,
          inputType: InputType.password,
          backgroundColor: appTheme.colors.tertiaryBackground,
          inputBorder: state.isApiError && state.errorMessage.isNotEmpty
              ? appTheme.textInputErrorBorderStyle
              : appTheme.passwordFieldBorder,
          hint: Strings.currentPasswordHint,
          hintStyle: hintStyle,
          valueStyle: valueStyle,
          onChanged: (newValue) =>
              viewModel.updateCurrentPasswordField(newValue),
        ),
        if (state.isApiError && state.errorMessage.isNotEmpty)
          _errorWidget(
            state: state,
            appTheme: appTheme,
            style: isTablet
                ? appTheme.typographies.interFontFamily.errorLabel3
                    .copyWith(fontWeight: FontWeight.w400)
                : appTheme.typographies.interFontFamily.errorLabel4
                    .copyWith(fontWeight: FontWeight.w400),
          ),
        SizedBox(
          height: _size24,
        ),
        const GeneralDivider(),
        SizedBox(
          height: _size20,
        ),
        const GeneralText(
          Strings.newPassword,
          typography: TypographyFamily.label2,
        ),
        SizedBox(
          height: _size8,
        ),
        GeneralTextInput(
          controller: _newPasswordController,
          inputType: InputType.password,
          backgroundColor: appTheme.colors.tertiaryBackground,
          inputBorder: !state.isApiError && state.errorMessage.isNotEmpty
              ? appTheme.textInputErrorBorderStyle
              : appTheme.passwordFieldBorder,
          hint: Strings.newPasswordHint,
          hintStyle: hintStyle,
          valueStyle: valueStyle,
          onChanged: (newValue) =>
              viewModel.updateNewPasswordFields(newPassword: newValue),
        ),
        _showError(
          appTheme: appTheme,
          state: state,
          isTablet: isTablet,
        ),
        SizedBox(
          height: _mobilePadding,
        ),
        const GeneralText(
          Strings.confirmPassword,
          typography: TypographyFamily.label2,
        ),
        SizedBox(
          height: _size8,
        ),
        GeneralTextInput(
          controller: _confirmPasswordController,
          inputType: InputType.password,
          backgroundColor: appTheme.colors.tertiaryBackground,
          inputBorder: !state.isApiError && state.errorMessage.isNotEmpty
              ? appTheme.textInputErrorBorderStyle
              : appTheme.passwordFieldBorder,
          hint: Strings.confirmPasswordHint,
          hintStyle: hintStyle,
          valueStyle: valueStyle,
          onChanged: (newValue) => viewModel.updateNewPasswordFields(
            confirmPassword: newValue,
            validate: true,
          ),
        ),
        _showError(
          appTheme: appTheme,
          state: state,
          isTablet: isTablet,
        ),
      ],
    );
  }

  Widget _showError({
    required IAppThemeData appTheme,
    required ChangePasswordScreenState state,
    bool isTablet = false,
  }) {
    return Visibility(
      visible: !state.isApiError && state.errorMessage.isNotEmpty,
      child: _errorWidget(
        state: state,
        appTheme: appTheme,
        style: isTablet
            ? appTheme.typographies.interFontFamily.errorLabel3
                .copyWith(fontWeight: FontWeight.w400)
            : appTheme.typographies.interFontFamily.errorLabel4
                .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _errorWidget({
    required ChangePasswordScreenState state,
    required IAppThemeData appTheme,
    required TextStyle style,
  }) {
    return Column(
      children: [
        SizedBox(height: _size8),
        GeneralText(
          state.errorMessage,
          style: style,
        ),
      ],
    );
  }

  Widget _button({
    required IAppThemeData appTheme,
    bool isTablet = false,
  }) {
    return GeneralButton(
      title: Strings.confirm,
      width: double.infinity,
      isEnable: _passwordController.text.isNotEmpty &&
          _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          (_newPasswordController.text == _confirmPasswordController.text),
      style: isTablet
          ? appTheme.confirmTabButtonStyle
          : appTheme.confirmButtonStyle,
      onTap: () => viewModel.updatePassword(),
      buttonType: ButtonType.button,
      isBusy: false,
    );
  }
}
