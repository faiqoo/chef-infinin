import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';

enum SelectableStatus {
  checked,
  unchecked,
  unknown,
}

enum SelectableIcon {
  radio,
  checkbox,
}

class GeneralSelectable extends StatelessWidget {
  const GeneralSelectable({
    required SelectableModel selectable,
    required SelectableIcon icon,
    required Function(SelectableModel selectable) onTap,
    Key? key,
  })  : _selectable = selectable,
        _onTap = onTap,
        _icon = icon,
        super(key: key);

  factory GeneralSelectable.radio({
    required SelectableModel selectable,
    required Function(SelectableModel selectable) onTap,
    SelectableIcon? icon,
  }) {
    return GeneralSelectable(
      selectable: selectable,
      icon: icon ?? SelectableIcon.radio,
      onTap: onTap,
    );
  }

  factory GeneralSelectable.checkbox({
    required SelectableModel selectable,
    required Function(SelectableModel selectable) onTap,
    SelectableIcon? icon,
  }) {
    return GeneralSelectable(
      selectable: selectable,
      icon: icon ?? SelectableIcon.checkbox,
      onTap: onTap,
    );
  }

  final SelectableModel _selectable;
  final SelectableIcon _icon;
  final Function(SelectableModel optionValue)? _onTap;

  static const _defaultIconSize = 20.0;
  static const _labelMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return InkWell(
      onTap: () {
        _onTap!(_selectable);
      },
      child: Expanded(
        child: Row(
          children: [
            _buildIcon(context),
            const SizedBox(width: _labelMargin),
            _buildLabel(appTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Container(
      height: _defaultIconSize,
      width: _defaultIconSize,
      decoration: BoxDecoration(
        shape: _icon == SelectableIcon.radio
            ? BoxShape.circle
            : BoxShape.rectangle,
        color: _selectIconBackground(),
        borderRadius:
            _icon == SelectableIcon.checkbox ? BorderRadius.circular(4) : null,
        border: _icon == SelectableIcon.checkbox
            ? Border.all(color: _selectBorderColor(appTheme))
            : null,
      ),
      child: _selectIcon(appTheme),
    );
  }

  Color _selectIconBackground() {
    switch (_selectable.status) {
      case SelectableStatus.checked:
      case SelectableStatus.unknown:
        return _selectable.checkedColor;
      case SelectableStatus.unchecked:
      default:
        return Colors.transparent;
    }
  }

  Color _selectBorderColor(IAppThemeData appTheme) {
    if (_selectable.isDisable) {
      return appTheme.colors.disabledText;
    } else {
      switch (_selectable.status) {
        case SelectableStatus.checked:
        case SelectableStatus.unknown:
          return _selectable.checkedColor;
        case SelectableStatus.unchecked:
        default:
          return appTheme.colors.defaultBorder;
      }
    }
  }

  Widget? _selectIcon(IAppThemeData appTheme) {
    switch (_selectable.status) {
      case SelectableStatus.checked:
        return FittedBox(
          child: Icon(
            _icon == SelectableIcon.checkbox
                ? Icons.check
                : Icons.radio_button_off,
            color: appTheme.colors.secondaryBackground,
          ),
        );
      case SelectableStatus.unchecked:
        return Icon(
          _icon == SelectableIcon.checkbox
              ? null
              : Icons.radio_button_unchecked,
        );
      case SelectableStatus.unknown:
      default:
        return null;
    }
  }

  Widget _buildLabel(IAppThemeData appTheme) => Flexible(
        child: Text(
          _selectable.label,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: _selectable.isDisable ? appTheme.colors.disabledText : null,
          ),
        ),
      );
}

class SelectableModel {
  SelectableModel({
    required this.id,
    required this.label,
    required this.value,
    required this.status,
    required this.checkedColor,
    this.isDisable = false,
  });

  final String id;
  final String label;
  final String value;
  final SelectableStatus status;
  final Color checkedColor;
  final bool isDisable;
}
