import 'package:flutter/material.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/widgets/general_text.dart';

class GeneralHomeItem extends StatelessWidget {
  const GeneralHomeItem({
    required String text,
    dynamic Function()? onTap,
    IconData? icon,
    Key? key,
  })  : _text = text,
        _icon = icon,
        _onTap = onTap,
        super(key: key);

  final String _text;
  final IconData? _icon;
  final dynamic Function()? _onTap;

  static const _boxHeight = 35.0;
  static const _boxBottomHeight = 40.0;
  static const _verticalPadding = 20.0;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return InkWell(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: _verticalPadding),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _icon,
              color: appTheme.colors.defaultBackground,
            ),
            const SizedBox(
              height: _boxBottomHeight,
            ),
            SizedBox(
              height: _boxHeight,
              child: GeneralText(
                _text,
                color: appTheme.colors.defaultBackground,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
