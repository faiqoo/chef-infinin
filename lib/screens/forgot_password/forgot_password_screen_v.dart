import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/screens/forgot_password/forgot_password_screen_m.dart';
import 'package:chef/screens/forgot_password/forgot_password_screen_vm.dart';
import 'package:chef/services/services.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends BaseView<ForgotPasswordScreenViewModel> {
  ForgotPasswordScreen({
    required this.baseUrl,
    Key? key,
  }) : super(key: key);

  final String baseUrl;

  final _padding = 32.0;

  final _emailController = TextController();

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    final size = screenSizeData.size;
    return BlocBuilder<ForgotPasswordScreenViewModel,
        ForgotPasswordScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        _emailController.text = state.email;
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.colors.secondaryBackground,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  screenSizeData.screenType == ScreenType.small
                      ? _buildMobileView(
                          context: context,
                          state: state,
                          appTheme: appTheme,
                          size: size,
                        )
                      : _buildTabletView(
                          context: context,
                          state: state,
                          appTheme: appTheme,
                          size: size,
                        ),
                  if (state.isBusy) const GeneralLoading(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildVerticalSpace(
        //   size: size,
        //   portion: .04,
        // ),
        _buildScanButtonSpace(
          appTheme: appTheme,
          context: context,
          padding: 16,
          radius: 20,
        ),
        _buildVerticalSpace(
          size: size,
          portion: .045,
        ),
        // const Padding(
        //   padding: EdgeInsets.only(
        //     left: 32,
        //     right: 24,
        //   ),
        //   child: ExtoLogo(),
        // ),
        Padding(
          padding: EdgeInsets.only(left: _padding),
          // child: ExtoButton.button(
          //   title: Strings.forgotPassword,
          //   styleType: ButtonStyleType.fill,
          //   onTap: () {
          //     // viewModel.goToForgotPasswordScreen();
          //   },
          // ),

          child: InkWell(
            onTap: () {
              viewModel.pop();
            },
            child: Container(
              height: 36.0,
              width: 36.0,
              color: appTheme.colors.defaultBackground,
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.colors.defaultBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Resources.backArrow,
                    // height: height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),

        _buildVerticalSpace(
          size: size,
          portion: .066,
        ),
        Visibility(
          child: Padding(
            padding: EdgeInsets.only(left: _padding),
            child: _forgotPasswordText(
              appTheme: appTheme,
              titleStyle: appTheme.typographies.interFontFamily.headline3,
              bodyStyle: appTheme.typographies.interFontFamily.label4,
            ),
          ),
          visible: !state.success,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.035,
        ),
        state.success
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding),
                child: _successWidget(
                  appTheme: appTheme,
                  titleStyle: appTheme.typographies.interFontFamily.headline4,
                  bodyStyle:
                      appTheme.typographies.interFontFamily.body2R.copyWith(
                    color: appTheme.colors.secondaryDark,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: _padding),
                  //   child: _labelText(
                  //     appTheme: appTheme,
                  //     style: appTheme.typographies.interFontFamily.label2,
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding),
                    child: _emailTextField(
                      state: state,
                      appTheme: appTheme,
                      valueStyle: appTheme.typographies.interFontFamily.body2M,
                      hintStyle: appTheme.typographies.interFontFamily.body2R,
                    ),
                  ),
                  Visibility(
                    visible: state.errorMessage.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: _padding),
                      child: _errorWidget(
                        state: state,
                        appTheme: appTheme,
                        style:
                            appTheme.typographies.interFontFamily.errorLabel4,
                      ),
                    ),
                  )
                ],
              ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: _buttonWidget(
            context: context,
            state: state,
            appTheme: appTheme,
            style1: appTheme.typographies.interFontFamily.caption4,
            style2: appTheme.typographies.interFontFamily.label4.copyWith(
              color: appTheme.colors.primaryBackground,
            ),
          ),
        ),

        _buildVerticalSpace(
          size: size,
          portion: .40,
        ),

        _projectName(

            //  size: size,
            ),
      ],
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVerticalSpace(
          size: size,
          portion: .04,
        ),
        _buildScanButtonSpace(
          appTheme: appTheme,
          context: context,
          padding: 40,
          radius: 32,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.06,
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            const GeneralLogo(),
          ],
        ),
        _buildVerticalSpace(
          size: size,
          portion: .066,
        ),
        _buildForgotPasswordText(
          appTheme: appTheme,
          size: size,
          state: state,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.035,
        ),
        state.success
            ? _buildSentSuccess(
                appTheme: appTheme,
                size: size,
              )
            : _buildForgotPasswordField(
                context: context,
                state: state,
                appTheme: appTheme,
                size: size,
              ),
        _buildButton(
          appTheme: appTheme,
          size: size,
          context: context,
          state: state,
        )
      ],
    );
  }

  Widget _buildVerticalSpace({
    required Size size,
    required double portion,
  }) =>
      SizedBox(height: size.height * portion);

  Widget _buildHorizontalSpace({
    required Size size,
    required double portion,
  }) =>
      SizedBox(width: size.width * portion);

  Widget _buildForgotPasswordText({
    required Size size,
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
  }) {
    return Visibility(
      visible: !state.success,
      child: Row(
        children: [
          _buildHorizontalSpace(
            size: size,
            portion: 0.26,
          ),
          _forgotPasswordText(
            appTheme: appTheme,
            titleStyle: appTheme.typographies.interFontFamily.headline2,
            bodyStyle: appTheme.typographies.interFontFamily.label1,
            sizedBoxHeight: 10,
            messageFontSize: 16,
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordText({
    required IAppThemeData appTheme,
    required TextStyle titleStyle,
    required TextStyle bodyStyle,
    double sizedBoxHeight = 8,
    double messageFontSize = 12,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.forgotPassword,
          style: titleStyle,
        ),
        SizedBox(height: sizedBoxHeight),
        GeneralText(
          Strings.forgotPasswordMessage,
          style: bodyStyle,
        )
      ],
    );
  }

  Widget _buildScanButtonSpace({
    required BuildContext context,
    required double padding,
    required double radius,
    required IAppThemeData appTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: padding,
          ),
          child: CircleAvatar(
            backgroundColor: appTheme.colors.transparent,
            radius: radius,
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasswordField({
    required BuildContext context,
    required ForgotPasswordScreenState state,
    required Size size,
    required IAppThemeData appTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _labelText(
              appTheme: appTheme,
              style: appTheme.typographies.interFontFamily.label1,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            Flexible(
              child: _emailTextField(
                state: state,
                appTheme: appTheme,
                valueStyle: appTheme.typographies.interFontFamily.body1
                    .copyWith(color: appTheme.colors.primaryText),
                hintStyle: appTheme.typographies.interFontFamily.body1,
              ),
            ),
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
          ],
        ),
        Visibility(
          visible: state.errorMessage.isNotEmpty,
          child: Row(
            children: [
              _buildHorizontalSpace(
                size: size,
                portion: 0.26,
              ),
              Flexible(
                child: _errorWidget(
                  state: state,
                  appTheme: appTheme,
                  style: appTheme.typographies.interFontFamily.button3.copyWith(
                    color: appTheme.colors.errorLabel,
                  ),
                  lowSpace: 8,
                ),
              ),
              _buildHorizontalSpace(
                size: size,
                portion: 0.26,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _errorWidget({
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required TextStyle style,
    double lowSpace = 4,
  }) {
    return Column(
      children: [
        SizedBox(height: lowSpace),
        GeneralText(
          state.errorMessage,
          style: style,
        ),
      ],
    );
  }

  Widget _emailTextField({
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required TextStyle valueStyle,
    required TextStyle hintStyle,
  }) {
    return GeneralTextInput(
      controller: _emailController,
      hint: Strings.emailAddress,
      valueStyle: valueStyle,
      hintStyle: hintStyle,
      inputBorder: state.errorMessage.isNotEmpty
          ? appTheme.errorBorder
          : appTheme.focusedBorder,
      validator: (_) {
        return null;
      },
      onChanged: (newValue) {
        viewModel.onFormValuesChange(email: newValue);
      },
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Row(
      children: [
        _buildHorizontalSpace(
          size: size,
          portion: 0.26,
        ),
        Flexible(
          child: _buttonWidget(
            context: context,
            state: state,
            appTheme: appTheme,
            style1: appTheme.typographies.interFontFamily.label2,
            style2: appTheme.typographies.interFontFamily.caption3,
            spacer: 24,
          ),
        ),
        _buildHorizontalSpace(
          size: size,
          portion: 0.26,
        ),
      ],
    );
  }

  Widget _buttonWidget({
    required BuildContext context,
    required ForgotPasswordScreenState state,
    required IAppThemeData appTheme,
    required TextStyle style1,
    required TextStyle style2,
    double spacer = 16,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: spacer),
        GeneralButton.button(
          title: state.success
              ? (Strings.returnTo + Strings.signIn.toLowerCase())
              : Strings.sendResetLink,
          width: double.infinity,
          isEnable: _emailController.text.isNotEmpty,
          onTap: () {
            state.success
                ? viewModel.pop()
                : viewModel.forgotPassword(
                    email: _emailController.text,
                    baseUrl: baseUrl,
                    context: context,
                  );
          },
        ),
        const SizedBox(height: 24),
        // Visibility(
        //   visible: !state.success,
        //   child: RichText(
        //     text: TextSpan(
        //       text: Strings.returnTo,
        //       style: style1,
        //       children: <TextSpan>[
        //         TextSpan(
        //           recognizer: TapGestureRecognizer()
        //             ..onTap = () => viewModel.pop(),
        //           text: Strings.signIn,
        //           style: style2,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        //  SizedBox(height: spacer),
        //Spacer(),
      ],
    );
  }

  Widget _projectName() {
    return Center(
      child: Column(
        children: [
          //  Center(
          SvgPicture.asset(
            Resources.exto,
            // height: height,
            fit: BoxFit.cover,
          ),
          // ),,
          // _buildVerticalSpace(
          //   size: size,
          //   portion: 0.04,
          // ),
        ],
      ),
    );
  }

  Widget _buildSentSuccess({
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Row(
      children: [
        _buildHorizontalSpace(
          size: size,
          portion: 0.26,
        ),
        Flexible(
          child: _successWidget(
            appTheme: appTheme,
            titleStyle: appTheme.typographies.interFontFamily.headline2,
            bodyStyle: appTheme.typographies.interFontFamily.headline4
                .copyWith(fontWeight: FontWeight.w500),
            spacer: 24,
          ),
        ),
        _buildHorizontalSpace(size: size, portion: 0.26),
      ],
    );
  }

  Widget _successWidget({
    required IAppThemeData appTheme,
    required TextStyle titleStyle,
    required TextStyle bodyStyle,
    double spacer = 8,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.sentSuccessfully,
          style: titleStyle,
        ),
        SizedBox(height: spacer),
        GeneralText(
          Strings.checkInstruction,
          maxLines: 2,
          style: bodyStyle,
        ),
        SizedBox(height: spacer * 3),
      ],
    );
  }

  Widget _labelText({
    required IAppThemeData appTheme,
    required TextStyle style,
  }) {
    return GeneralText(
      Strings.emailAddress,
      style: style,
    );
  }
}
