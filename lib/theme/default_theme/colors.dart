part of 'default_theme.dart';

abstract class _IColors {
  static const transparent = Color.fromRGBO(255, 255, 255, 0);

  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const black01 = Color.fromRGBO(21, 20, 31, 1);

  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const grey0 = Color.fromRGBO(235, 236, 240, 1);
  static const grey01 = Color.fromRGBO(224, 224, 224, 1);
  static const grey02 = Color.fromRGBO(179, 190, 209, 1);
  static const grey03 = Color.fromRGBO(161, 161, 161, 1);
  static const grey04 = Color.fromRGBO(157, 162, 179, 1);
  static const grey05 = Color.fromRGBO(99, 99, 99, 1);
  static const grey06 = Color.fromRGBO(244, 245, 247, 1);
  static const grey07 = Color.fromRGBO(105, 125, 149, 1);
  static const grey08 = Color.fromRGBO(37, 42, 49, 1);
  static const grey09 = Color.fromRGBO(51, 51, 51, 1);
  static const grey10 = Color.fromRGBO(41, 45, 51, 1);
  static const grey11 = Color.fromRGBO(146, 147, 151, 1);
  static const grey12 = Color.fromRGBO(234, 234, 235, 1);
  static const grey13 = Color.fromRGBO(244, 245, 245, 1);
  static const grey14 = Color.fromRGBO(25, 25, 25, 1);
  static const grey15 = Color.fromRGBO(105, 109, 143, 1);
  static const grey16 = Color.fromRGBO(38, 40, 51, 0.7);
  static const grey17 = Color.fromRGBO(246, 246, 246, 1);
  static const grey18 = Color.fromRGBO(173, 173, 173, 1);
  static const grey19 = Color.fromRGBO(232, 232, 232, 1);
  static const grey20 = Color.fromRGBO(148, 150, 153, 1);
  static const grey21 = Color.fromRGBO(105, 108, 112, 1);
  static const grey22 = Color.fromRGBO(223, 223, 224, 1);

  static const grey23 = Color.fromRGBO(191, 192, 194, 1);

  static const blue00 = Color.fromRGBO(0, 171, 232, 1);
  static const blue01 = Color.fromRGBO(197, 220, 250, 1);
  static const blue02 = Color.fromRGBO(19, 154, 225, 1);

  static const blue04 = Color.fromRGBO(22, 114, 236, 1);
  static const blue05 = Color.fromRGBO(19, 154, 225, 1);
  static const blue07 = Color.fromRGBO(42, 97, 246, 1);
  static const blue09 = Color.fromRGBO(45, 51, 99, 1);
  static const blue10 = Color.fromRGBO(81, 101, 247, 1);
  static const blue11 = Color.fromRGBO(81, 101, 247, 1);
  static const blue12 = Color.fromRGBO(81, 101, 247, 0.08);

  static const green0 = Color.fromRGBO(225, 248, 226, 1);
  static const green04 = Color.fromRGBO(42, 185, 48, 1);
  static const green05 = Color.fromRGBO(31, 139, 36, 1);
  static const green06 = Color.fromRGBO(21, 93, 24, 1);

  static const red0 = Color.fromRGBO(201, 64, 49, 1);
  static const red04 = Color.fromRGBO(245, 65, 61, 1);
  static const red05 = Color.fromRGBO(218, 16, 11, 1);
  static const red06 = Color.fromRGBO(145, 11, 8, 1);
  static const red07 = Color.fromRGBO(251, 78, 78, 1);

  static const blueBG = Color.fromRGBO(250, 251, 253, 1);
  static const blue03 = Color.fromRGBO(80, 150, 241, 1);
  static const blue06 = Color.fromRGBO(10, 57, 119, 1);

  static const orange0 = Color.fromRGBO(252, 241, 227, 1);
  static const orange04 = Color.fromRGBO(237, 149, 38, 1);
  static const orange05 = Color.fromRGBO(191, 113, 15, 1);
  static const orange06 = Color.fromRGBO(127, 76, 10, 1);

  static const purple0 = Color.fromRGBO(81, 101, 247, 1);
  static const purple01 = Color.fromRGBO(241, 243, 254, 1);

  static const pink0 = Color.fromRGBO(252, 237, 238, 1.0);

  static const black0 = Color.fromRGBO(33, 33, 41, 1);

  static const greyDark = Color.fromRGBO(144, 144, 148, 1);

  static const blackBrightness = Color.fromRGBO(33, 33, 41, 1);

  // static const black00= Color.fromRGBO(33, 33, 41, 1);
  static const buttonColor = Color(0xffbb3127);
  static const textFieldColor = Color(0xff35353c);
  static const textFieldBorderColor = Color(0xfff1c452);
}

class _Colors implements IColors {
  const _Colors();

  @override
  Color get primary => _IColors.black;

  @override
  Color get defaultText => _IColors.black;

  @override
  Color get primaryText => _IColors.grey08;

  @override
  Color get primaryTitleText => _IColors.blue09;

  @override
  Color get primaryBackground => _IColors.black0;

  @override
  Color get secondaryBackground => _IColors.white;

  @override
  Color get subtitleText => _IColors.grey04;

  @override
  Color get selectedText => _IColors.blue05;

  @override
  Color get lightPrimaryBackground => _IColors.blue04;

  @override
  Color get disabledPrimaryBackground => _IColors.grey23;

  @override
  Color get foregroundColor => _IColors.grey05;

  @override
  Color get divider => _IColors.grey01;

  // @override
  // Color get disabledText => _IColors.grey16;

  @override
  Color get disabledText => _IColors.white;

  @override
  Color get secondaryText => _IColors.white;

  @override
  Color get defaultBackground => _IColors.grey0;

  @override
  Color get defaultBorder => _IColors.grey02;

  @override
  Color get primaryBorder => _IColors.blue02;

  @override
  Color get errorLabel => _IColors.red0;

  @override
  Color get defaultHelper => _IColors.grey03;

  @override
  Color get errorBorder => _IColors.red0;

  static const _opacity = .5;

  @override
  Color get transparent => _IColors.transparent;

  @override
  Color get mainBackground => _IColors.grey06;

  @override
  Color get headerPrimaryBackground => _IColors.blue01.withOpacity(_opacity);

  @override
  Color get headerWarningBackground => _IColors.red0;

  @override
  Color get navItem => _IColors.grey06;

  @override
  Color get successBackground => _IColors.green0;

  @override
  Color get successLight => _IColors.green04;

  @override
  Color get successCaption => _IColors.green05;

  @override
  Color get successDark => _IColors.textFieldBorderColor;

  @override
  Color get errorBackground => _IColors.red0.withOpacity(0.2);

  @override
  Color get errorLight => _IColors.red04;

  @override
  Color get errorCaption => _IColors.red05;

  @override
  Color get errorDark => _IColors.red06;

  @override
  Color get primaryLightBackground => _IColors.blueBG;

  @override
  Color get primaryDarkBackground => _IColors.blue04;

  @override
  Color get primaryLight => _IColors.blue03;

  @override
  Color get primaryCaption => _IColors.grey14.withOpacity(0.7);

  @override
  Color get primaryDark => _IColors.blue06;

  @override
  Color get warningBackground => _IColors.orange0;

  @override
  Color get warningLight => _IColors.orange04;

  @override
  Color get warningCaption => _IColors.orange05;

  @override
  Color get warningDark => _IColors.orange06;

  @override
  Color get secondaryLight => _IColors.grey03;

  @override
  Color get secondaryCaption => _IColors.grey05;

  @override
  Color get secondaryDark => _IColors.grey09;

  @override
  Color get cardHoverBorder => _IColors.blue05;

  @override
  Color get cardBorderColor => _IColors.grey12;

  @override
  Color get disabledNavItemBackground => _IColors.grey01;

  @override
  // Color get shadow => _IColors.grey05.withOpacity(_opacity);
  Color get shadow => _IColors.white.withOpacity(_opacity);

  @override
  Color get focusedBorder => _IColors.blue02;

  @override
  Color get defaultLabel => _IColors.grey07;

  @override
  Color get focusedLabel => _IColors.grey07;

  @override
  Color get successLabel => _IColors.green05;

  @override
  Color get successIcon => _IColors.green05;

  @override
  Color get errorIcon => _IColors.red06;

  @override
  Color get shimmerBase => _IColors.grey01;

  @override
  Color get shimmerHighlight => _IColors.grey0;

  @override
  Color get searchBorder => _IColors.grey10;

  @override
  Color get workspaceIcon => _IColors.grey11;

  @override
  Color get innerBorder => _IColors.grey12;

  @override
  Color get workspaceBackground => _IColors.grey13;

  @override
  Color get workspaceSubtitle => _IColors.grey14;

  @override
  Color get randomColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Color get workspaceTabletIcon => _IColors.grey15;

  @override
  Color get selectedBottomSheetItem => _IColors.purple0;

  @override
  Color get selectedBottomSheetItemBackground => _IColors.purple01;

  @override
  Color get selectMenuItemBackground => _IColors.blue12;

  @override
  Color get primaryLeftSideTint => _IColors.blue10;

  @override
  Color get selectedItemBackground => _IColors.blue11;

  @override
  Color get expansionTileItemBackground => _IColors.grey13;

  @override
  Color get tertiaryBackground => _IColors.grey17;

  @override
  Color get mainBlack100 => _IColors.black01;

  @override
  Color get tertiaryText => _IColors.grey18;

  @override
  Color get defaultError => _IColors.red07;

  @override
  Color get platformTextColor => _IColors.blue00;

  @override
  Color get filledButtonColor => _IColors.buttonColor;

  @override
  Color get verificationBackGround => _IColors.blackBrightness;

  @override
  Color stringColor(String strCode) {
    return HexColor.fromHex(strCode);
  }

  @override
  Color get mandatoryItemBackground => _IColors.pink0;

  @override
  Color get defaultTrailingIcon => _IColors.grey20;

  @override
  Color get textFieldFilledColor => _IColors.textFieldColor;

  @override
  Color get textFieldBorderColor => _IColors.textFieldBorderColor;
}
