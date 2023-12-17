import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'typographies.dart';

abstract class IAppThemeData {
  ThemeData get mainTheme;

  ITypographies get typographies;

  IColors get colors;

  // Buttons
  ButtonStyle get filledButtonStyle;
  ButtonStyle get filledTabButtonStyle;
  ButtonStyle get confirmButtonStyle;
  ButtonStyle get confirmTabButtonStyle;
  ButtonStyle get disabledFilledButtonStyle;
  ButtonStyle get outlinedButtonStyle;
  ButtonStyle get disabledOutlinedButtonStyle;
  ButtonStyle get plainButtonStyle;
  ButtonStyle get plainTabButtonStyle;
  ButtonStyle get disabledPlainButtonStyle;
  ButtonStyle get fabFilledButtonStyle;
  ButtonStyle get fabOutlinedButtonStyle;
  ButtonStyle get fabPlainButtonStyle;
  ButtonStyle get disabledFabFilledButtonStyle;
  ButtonStyle get disabledFabOutlinedButtonStyle;
  ButtonStyle get disabledFabPlainButtonStyle;
  ButtonStyle get smallFabFilledButtonStyle;
  ButtonStyle get smallFabOutlinedButtonStyle;
  ButtonStyle get smallFabPlainButtonStyle;
  ButtonStyle get disabledSmallFabFilledButtonStyle;
  ButtonStyle get disabledSmallFabOutlinedButtonStyle;
  ButtonStyle get disabledSmallFabPlainButtonStyle;

  InputBorder get inputBorder;
  InputBorder get focusedBorder;
  InputBorder get passwordFieldBorder;
  InputBorder get errorBorder;
  InputBorder get textInputErrorBorderStyle;
  InputBorder get searchbarBorder;

  BorderRadius get defaultBorderRadius;
  BorderRadius get mediumBorderRadius;

  // card
  BoxDecoration get cardDecoration;
  BoxDecoration get containerDecoration;
  BoxDecoration get selectedContainerDecoration;

  TextStyle get cardTitleTextStyle;
  TextStyle get cardSubtitleTextStyle;
  TextStyle get cardDescriptionTextStyle;

  // Dialog
  ShapeBorder get dialogShapeBorder;

  OutlinedBorder get checkboxShapeBorder;
  OutlinedBorder get cardBorder;
  OutlinedBorder get cardBorderWithRadius;

  BorderSide get checkboxBorderSide;

  Decoration get dialogHeaderPrimaryDecoration;
  Decoration get dialogHeaderErrorDecoration;
  Decoration get errorDecoration;
  Decoration get workspaceItemDecoration;
  Decoration get selectedMenuItemDecoration;
  Decoration get unselectedMenuItemDecoration;

  ///Status bar icons
  Brightness get lightBrightness;
  Brightness get darkBrightness;

  TextStyle getTextStyle({
    FontFamily fontFamily = FontFamily.poppins,
    TypographyFamily typographyFamily = TypographyFamily.body1,
    Color? color,
  }) {
    var style = typographies
        .byFontFamily(fontFamily)
        .byTypographyFamily(typographyFamily);

    if (color != null) {
      style = style.copyWith(color: color);
    }

    return style;
  }

  ///Use INTER Google Fonts
  TextStyle getGoogleFontsInterStyle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
    double? letterSpacing,
  }) {
    var style = GoogleFonts.inter(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );

    return style;
  }
}
