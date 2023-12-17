part of 'app_theme_data.dart';

enum TypographyFamily {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  label1,
  label2,
  label3,
  label4,
  label5,
  label6,
  label7,
  label8,
  errorLabel3,
  errorLabel4,
  body1,
  body2,
  body3,
  body4,
  body2R,
  body2M,
  button1,
  button3,
  caption3,
  caption4,
  alert2,
}

enum FontFamily { poppins }

abstract class ITypographies {
  const ITypographies();

  ITypography byFontFamily([
    FontFamily fontFamily,
  ]);

  ITypography get interFontFamily;
}

abstract class ITypography {
  const ITypography();

  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get headline3;
  TextStyle get headline4;
  TextStyle get headline5;
  TextStyle get headline6;
  TextStyle get headline7;
  TextStyle get label1;
  TextStyle get label2;
  TextStyle get label3;
  TextStyle get label4;
  TextStyle get label5;
  TextStyle get label6;
  TextStyle get label7;
  TextStyle get label8;
  TextStyle get label9;
  TextStyle get label10;
  TextStyle get label11;
  TextStyle get label12;
  TextStyle get label13;
  TextStyle get errorLabel3;
  TextStyle get errorLabel4;
  TextStyle get body1;
  TextStyle get body2;
  TextStyle get body3;
  TextStyle get body4;
  TextStyle get body2R;
  TextStyle get body2M;
  TextStyle get button1;
  TextStyle get button3;
  TextStyle get caption3;
  TextStyle get caption4;
  TextStyle get alert2;

  TextStyle byTypographyFamily(TypographyFamily? typographyFamily) {
    switch (typographyFamily) {
      case TypographyFamily.headline1:
        return headline1;
      case TypographyFamily.headline2:
        return headline2;
      case TypographyFamily.headline3:
        return headline3;
      case TypographyFamily.headline4:
        return headline4;
      case TypographyFamily.headline5:
        return headline5;
      case TypographyFamily.headline6:
        return headline6;
      case TypographyFamily.label1:
        return label1;
      case TypographyFamily.label2:
        return label2;
      case TypographyFamily.label3:
        return label3;
      case TypographyFamily.label4:
        return label4;
      case TypographyFamily.label5:
        return label5;
      case TypographyFamily.label6:
        return label6;
      case TypographyFamily.label7:
        return label7;
      case TypographyFamily.label8:
        return label8;
      case TypographyFamily.errorLabel3:
        return errorLabel3;
      case TypographyFamily.errorLabel4:
        return errorLabel4;
      case TypographyFamily.body1:
        return body1;
      case TypographyFamily.body2:
        return body2;
      case TypographyFamily.body3:
        return body3;
      case TypographyFamily.body4:
        return body4;
      case TypographyFamily.body2R:
        return body2R;
      case TypographyFamily.body2M:
        return body2M;
      case TypographyFamily.button1:
        return button1;
      case TypographyFamily.button3:
        return button3;
      case TypographyFamily.caption3:
        return caption3;
      case TypographyFamily.caption4:
        return caption4;
      case TypographyFamily.alert2:
        return alert2;
      default:
        return body1;
    }
  }
}
