import 'package:flutter/material.dart';

import 'package:chef/helpers/helpers.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

enum HeroType {
  avatar,
  text,
  icon,
}

enum HeroSize {
  large,
  medium,
  small,
}

class GeneralHero extends StatelessWidget {
  const GeneralHero({
    required HeroType heroType,
    required HeroSize heroSize,
    String? imageAsset,
    String? imageURL,
    String? text,
    Icon? icon,
    Color? backgroundColor,
    bool isShapeSquare = false,
    Key? key,
  })  : assert(
          heroType != HeroType.avatar || imageAsset != null || imageURL != null,
          'Either imageAsset or imageURL must be provided when using avatar type',
        ),
        _heroType = heroType,
        _heroSize = heroSize,
        _imageAsset = imageAsset,
        _imageURL = imageURL,
        _icon = icon,
        _text = text,
        _backgroundColor = backgroundColor,
        _isShapeSquare = isShapeSquare,
        super(key: key);

  factory GeneralHero.smallImage({
    String? imageAsset,
    String? imageURL,
    Color? backgroundColor,
  }) =>
      GeneralHero(
        heroType: HeroType.avatar,
        heroSize: HeroSize.medium,
        imageAsset: imageAsset,
        imageURL: imageURL,
        backgroundColor: backgroundColor,
      );

  factory GeneralHero.largeImage({
    String? imageAsset,
    String? imageURL,
    Color? backgroundColor,
  }) =>
      GeneralHero(
        heroType: HeroType.avatar,
        heroSize: HeroSize.large,
        imageAsset: imageAsset,
        imageURL: imageURL,
        backgroundColor: backgroundColor,
      );

  factory GeneralHero.smallText({
    String? text,
    Color? backgroundColor,
  }) =>
      GeneralHero(
        heroType: HeroType.text,
        heroSize: HeroSize.medium,
        text: text,
        backgroundColor: backgroundColor,
      );
  factory GeneralHero.mediumText({
    required Color leadingBackground,
    String? text,
    bool isShapeSquare = false,
  }) =>
      GeneralHero(
        heroType: HeroType.text,
        heroSize: HeroSize.medium,
        text: text,
        isShapeSquare: isShapeSquare,
        backgroundColor: leadingBackground,
      );

  factory GeneralHero.largeText({
    String? text,
    Color? backgroundColor,
  }) =>
      GeneralHero(
        heroType: HeroType.text,
        heroSize: HeroSize.large,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory GeneralHero.smallIcon({
    required Icon icon,
    Color? backgroundColor,
  }) =>
      GeneralHero(
        heroType: HeroType.icon,
        heroSize: HeroSize.small,
        icon: icon,
        backgroundColor: backgroundColor,
      );
  factory GeneralHero.largeIcon({
    required Icon icon,
    required Color leadingBackground,
    bool isShapeSquare = false,
  }) =>
      GeneralHero(
        heroType: HeroType.icon,
        heroSize: HeroSize.medium,
        icon: icon,
        isShapeSquare: isShapeSquare,
        backgroundColor: leadingBackground,
      );

  final String? _imageAsset;
  final String? _imageURL;
  final String? _text;
  final Icon? _icon;
  final Color? _backgroundColor;
  final HeroType _heroType;
  final HeroSize _heroSize;
  final bool _isShapeSquare;

  static const _largeSize = 74.0;
  static const _mediumSize = 40.0;
  static const _smallSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return SizedBox(
      height: _specifySize(),
      width: _specifySize(),
      child: _isShapeSquare
          ? ClipRRect(
              borderRadius: appTheme.mediumBorderRadius,
              child: Container(
                alignment: Alignment.center,
                color: _backgroundColor,
                child: _buildChild(
                  appTheme,
                  isShapeSquare: true,
                ),
              ),
            )
          : CircleAvatar(
              child: _buildChild(appTheme),
              backgroundImage: _buildHeroAvatar(appTheme),
              backgroundColor:
                  _backgroundColor ?? appTheme.colors.disabledPrimaryBackground,
            ),
    );
  }

  Widget _buildHeroText(IAppThemeData appTheme, {bool isShapeSquare = false}) =>
      GeneralText(
        _text == null ? '' : _text!.getShortName(),
        typography:
            isShapeSquare ? TypographyFamily.body2 : TypographyFamily.headline4,
        color: appTheme.colors.secondaryText,
      );

  Widget? _buildChild(IAppThemeData appTheme, {bool isShapeSquare = false}) {
    if (_heroType == HeroType.text) {
      return _buildHeroText(appTheme, isShapeSquare: isShapeSquare);
    }
    if (_heroType == HeroType.icon) {
      return Center(child: _icon!);
    }
    return null;
  }

  ImageProvider<Object>? _buildHeroAvatar(IAppThemeData appTheme) {
    if (_heroType == HeroType.avatar && _imageAsset != null) {
      return AssetImage(_imageAsset!);
    } else if (_heroType == HeroType.avatar && _imageURL != null) {
      return NetworkImage(_imageURL!);
    }
    return null;
  }

  double _specifySize() {
    switch (_heroSize) {
      case HeroSize.large:
        return _largeSize;
      case HeroSize.medium:
        return _mediumSize;
      case HeroSize.small:
        return _smallSize;
    }
  }
}
