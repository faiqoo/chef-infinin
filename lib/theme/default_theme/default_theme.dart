import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:chef/helpers/color_helper.dart';
import 'package:chef/theme/theme.dart';

part 'colors.dart';
part 'theme_helper.dart';
part 'typographies.dart';

class DefaultTheme extends IAppThemeData {
  static const _smallBorderRadius = 2.0;
  static const _defaultBorderRadius = 4.0;
  static const _mediumBorderRadius = 8.0;
  static const _fabBorderRadius = 26.0;
  static const _smallFabBorderRadius = 18.0;
  static const _filledButtonElevation = 2.0;
  static const _zeroElevation = 0.0;
  static const _fabButtonElevation = 1.0;
  static const _fabHoverBorderWidth = 1.5;
  static const _searchbarBorderOpacity = 0.15;
  static const _transparentColor = Colors.transparent;
  static const _zeroPadding = EdgeInsets.zero;
  static const _buttonPadding = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 30.0,
  );

  @override
  ITypographies get typographies => const _Typographies();

  @override
  IColors get colors => const _Colors();

  @override
  ThemeData get mainTheme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  @override
  ButtonStyle get filledButtonStyle => ButtonStyle(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryText,
           color: colors.secondaryText,
          disableColor: colors.disabledText,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.primaryBackground,
          color: colors.filledButtonColor,
          disableColor: colors.disabledPrimaryBackground,
        ),
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.button3,
        ),
        padding: _buttonPaddingBuilder(_buttonPadding),
        shape: _filledButtonShapeBuilder(_mediumBorderRadius),
        mouseCursor: _disabledButtonsMouseCursorBuilder(),
        elevation: _buttonElevationBuilder(_filledButtonElevation),
      );

  @override
  ButtonStyle get confirmButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryText,
          color: colors.secondaryText,
          disableColor: colors.primary.withOpacity(0.3),
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.primaryBackground,
          color: colors.primaryBackground,
          disableColor: _IColors.grey17,
        ),
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.button3,
        ),
        padding: _buttonPaddingBuilder(_buttonPadding),
        shape: _filledButtonShapeBuilder(_mediumBorderRadius),
        elevation: _buttonElevationBuilder(_filledButtonElevation),
      );

  @override
  ButtonStyle get confirmTabButtonStyle => confirmButtonStyle.copyWith(
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.body1.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  @override
  ButtonStyle get filledTabButtonStyle => filledButtonStyle.copyWith(
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.button1,
        ),
      );

  @override
  ButtonStyle get fabFilledButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryBackground,
          color: colors.divider,
          disableColor: colors.disabledText,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.disabledPrimaryBackground,
          color: colors.foregroundColor,
          disableColor: colors.disabledPrimaryBackground,
        ),
        padding: _buttonPaddingBuilder(_zeroPadding),
        shape: _fabButtonShapeBuilder(_fabBorderRadius),
      );

  @override
  ButtonStyle get plainButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.primaryBackground,
          disableColor: colors.disabledText,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.divider,
          color: _transparentColor,
          disableColor: colors.disabledPrimaryBackground,
        ),
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.label4,
        ),
        elevation: _buttonElevationBuilder(_zeroElevation),
      );

  @override
  ButtonStyle get plainTabButtonStyle => plainButtonStyle.copyWith(
        textStyle: _textStyleBuilder(
          typographies.interFontFamily.label2,
        ),
      );

  @override
  ButtonStyle get outlinedButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
          disableColor: colors.disabledText,
        ),
        backgroundColor: MaterialStateProperty.all(colors.secondaryText),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _filledButtonElevation,
          elevation: _zeroElevation,
        ),
        shape: _outlinedButtonShapeBuilder(
          borderRadius: _defaultBorderRadius,
          borderColor: colors.disabledText,
          hoverBorderColor: colors.defaultBorder,
        ),
      );

  @override
  ButtonStyle get disabledFilledButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor:
            MaterialStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get disabledOutlinedButtonStyle => outlinedButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        shape: _filledButtonShapeBuilder(_defaultBorderRadius),
        elevation: _buttonElevationBuilder(_zeroElevation),
      );

  @override
  ButtonStyle get disabledPlainButtonStyle => plainButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
      );

  @override
  ButtonStyle get disabledFabFilledButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor:
            MaterialStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get fabOutlinedButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
          disableColor: colors.disabledText,
        ),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        elevation: _buttonElevationBuilder(_zeroElevation),
        shape: _fabOutlinedButtonShapeBuilder(
          hoverBorderWidth: _fabHoverBorderWidth,
          borderColor: colors.defaultBorder,
          hoverBorderColor: colors.disabledText,
          borderRadius: _fabBorderRadius,
        ),
      );

  @override
  ButtonStyle get disabledFabOutlinedButtonStyle =>
      fabOutlinedButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(colors.secondaryText),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _filledButtonElevation,
          elevation: _zeroElevation,
        ),
      );

  @override
  ButtonStyle get fabPlainButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
          disableColor: colors.disabledText,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryBackground,
          color: colors.defaultBackground,
          disableColor: colors.disabledPrimaryBackground,
        ),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _fabButtonElevation,
          elevation: _zeroElevation,
        ),
      );

  @override
  ButtonStyle get disabledFabPlainButtonStyle => fabPlainButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        elevation: _buttonElevationBuilder(_zeroElevation),
      );

  @override
  ButtonStyle get smallFabFilledButtonStyle => fabFilledButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ButtonStyle get smallFabOutlinedButtonStyle => fabOutlinedButtonStyle
      .copyWith(shape: _fabButtonShapeBuilder(_smallFabBorderRadius));

  @override
  ButtonStyle get smallFabPlainButtonStyle => fabPlainButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ButtonStyle get disabledSmallFabFilledButtonStyle =>
      disabledFabFilledButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ButtonStyle get disabledSmallFabOutlinedButtonStyle =>
      disabledFabFilledButtonStyle.copyWith(
        shape: _fabOutlinedButtonShapeBuilder(
          hoverBorderWidth: _fabHoverBorderWidth,
          borderColor: colors.defaultBorder,
          hoverBorderColor: colors.disabledText,
          borderRadius: _smallFabBorderRadius,
        ),
      );

  @override
  ButtonStyle get disabledSmallFabPlainButtonStyle =>
      disabledFabPlainButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        borderSide: const BorderSide(
          width: 0.5,
          style: BorderStyle.none,
        ),
      );

  @override
  InputBorder get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: _IColors.textFieldBorderColor,
          width: 2,
        ),
      );

  @override
  InputBorder get passwordFieldBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_mediumBorderRadius),
        borderSide: const BorderSide(
          color: _IColors.grey19,
        ),
      );

  @override
  InputBorder get errorBorder => focusedBorder.copyWith(
        borderSide: const BorderSide(color: _IColors.red0),
      );

  @override
  BorderRadius get defaultBorderRadius =>
      BorderRadius.circular(_defaultBorderRadius);

  @override
  BorderRadius get mediumBorderRadius =>
      BorderRadius.circular(_mediumBorderRadius);

  @override
  InputBorder get textInputErrorBorderStyle => OutlineInputBorder(
        borderSide: const BorderSide(color: _IColors.red07),
        borderRadius: BorderRadius.circular(_mediumBorderRadius),
      );

  // card
  @override
  BoxDecoration get cardDecoration => BoxDecoration(
        color: colors.secondaryBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        border: Border.all(color: colors.primaryBorder),
      );

  @override
  BoxDecoration get containerDecoration => BoxDecoration(
        color: colors.workspaceBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.cardBorderColor),
      );

  @override
  BoxDecoration get selectedContainerDecoration => BoxDecoration(
        color: colors.selectedBottomSheetItem,
        borderRadius: BorderRadius.circular(_mediumBorderRadius),
      );

  @override
  Decoration get selectedMenuItemDecoration => BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colors.primaryLeftSideTint,
            width: 3.0,
          ),
        ),
      );

  @override
  Decoration get unselectedMenuItemDecoration => BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colors.transparent,
            width: 3.0,
          ),
        ),
      );

  @override
  TextStyle get cardDescriptionTextStyle => _Typographies._interTypography.body1
      .copyWith(color: colors.foregroundColor);

  @override
  TextStyle get cardSubtitleTextStyle => _Typographies._interTypography.body2R
      .copyWith(color: colors.disabledPrimaryBackground);

  @override
  TextStyle get cardTitleTextStyle => _Typographies._interTypography.headline4;

  @override
  ShapeBorder get dialogShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_mediumBorderRadius),
        ),
      );

  @override
  OutlinedBorder get checkboxShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_smallBorderRadius),
        ),
      );

  @override
  OutlinedBorder get cardBorder => const RoundedRectangleBorder(
        side: BorderSide(
          color: _IColors.grey12,
        ),
      );

  @override
  OutlinedBorder get cardBorderWithRadius => RoundedRectangleBorder(
        side: const BorderSide(
          color: _IColors.grey12,
        ),
        borderRadius: BorderRadius.circular(6.0),
      );

  @override
  BorderSide get checkboxBorderSide => MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(color: colors.defaultBorder),
      );

  @override
  Decoration get dialogHeaderPrimaryDecoration => BoxDecoration(
        color: colors.headerPrimaryBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get dialogHeaderErrorDecoration => BoxDecoration(
        color: colors.headerWarningBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get errorDecoration => BoxDecoration(
        color: colors.errorBackground,
        borderRadius: BorderRadius.circular(5),
      );

  @override
  Decoration get workspaceItemDecoration => BoxDecoration(
        border: Border.all(color: colors.innerBorder),
        color: colors.secondaryBackground,
        borderRadius: BorderRadius.circular(_mediumBorderRadius),
      );

  @override
  Brightness get lightBrightness => Brightness.light;

  @override
  Brightness get darkBrightness => Brightness.dark;

  @override
  InputBorder get searchbarBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.searchBorder.withOpacity(_searchbarBorderOpacity),
        ),
        borderRadius: BorderRadius.circular(_mediumBorderRadius),
      );
}
