import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:chef/theme/app_theme_widget.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    Widget? title,
    Color? backgroundColor,
    List<Widget>? actions,
    bool automaticallyImplyLeading = false,
    bool centerTitle = false,
    Key? key,
  })  : _title = title,
        _backgroundColor = backgroundColor,
        _actions = actions,
        _automaticallyImplyLeading = automaticallyImplyLeading,
        _centerTitle = centerTitle,
        super(key: key);

  final Widget? _title;
  final Color? _backgroundColor;
  final List<Widget>? _actions;
  final bool _automaticallyImplyLeading;
  final bool _centerTitle;

  static const _appbarHeight = 60.0;

  @override
  Size get preferredSize => const Size.fromHeight(_appbarHeight);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return AppBar(
      centerTitle: _centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appTheme.colors.secondaryBackground,
        statusBarIconBrightness: appTheme.darkBrightness,
        statusBarBrightness: appTheme.lightBrightness,
      ),
      automaticallyImplyLeading: _automaticallyImplyLeading,
      backgroundColor: _backgroundColor,
      title: _title,
      actions: _actions,
      elevation: 0,
    );
  }
}
