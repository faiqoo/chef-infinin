import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

part 'exto_context_menu_divider.dart';
part 'exto_context_menu_item.dart';

class ExtoContextMenu extends StatelessWidget {
  const ExtoContextMenu({
    required List<ContextMenuAction> actions,
    Key? key,
  })  : _actions = actions,
        super(key: key);

  final List<ContextMenuAction> _actions;

  static const _menuIconSize = 25.0;
  static const _menuItemHorizontalPadding = 18.0;
  static const _menuMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: _menuMargin),
      child: PopupMenuButton(
        child: const Icon(
          Icons.more_vert,
          size: _menuIconSize,
        ),
        itemBuilder: (_) {
          return _buildItemList();
        },
        onSelected: (value) {
          final index = value as int;
          _actions[index].onTap?.call();
        },
      ),
    );
  }

  List<PopupMenuEntry<int>> _buildItemList() {
    final list = <PopupMenuEntry<int>>[];
    for (var action in _actions) {
      final index = _actions.indexOf(action);
      list.add(
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(
            horizontal: _menuItemHorizontalPadding,
          ),
          value: index,
          child: _ExtoContextMenuItem(
            icon: action.icon,
            title: action.title,
            subtitle: action.subtitle,
            onTap: action.onTap,
          ),
        ),
      );
      if (index < _actions.length - 1) {
        list.add(
          const _ExtoContextMenuDivider(),
        );
      }
    }
    return list;
  }
}

class ContextMenuAction {
  ContextMenuAction({
    this.icon,
    this.title,
    this.subtitle,
    this.onTap,
  }) : assert(
          icon != null || title != null,
          'Either icon or title should be provided',
        );

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onTap;
}
