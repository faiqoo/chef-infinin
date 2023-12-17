import 'package:flutter/material.dart';

import 'package:chef/services/services.dart';
import 'package:chef/setup.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/ui_kit/widgets/general_bottom_sheet_item.dart';

enum BottomSheetType {
  dateFormat,
  workspace,
}

class GBottomSheet<T> extends StatefulWidget {
  const GBottomSheet({
    required String bottomSheetTitle,
    required List<T> list,
    required T? selectedItem,
    BottomSheetType bottomSheetType = BottomSheetType.workspace,
    Key? key,
  })  : _bottomSheetTitle = bottomSheetTitle,
        _list = list,
        _selectedItem = selectedItem,
        _bottomSheetType = bottomSheetType,
        super(key: key);

  final String _bottomSheetTitle;
  final List<T> _list;
  final T? _selectedItem;
  final BottomSheetType _bottomSheetType;

  @override
  State<GBottomSheet<T>> createState() => _GBottomSheetState<T>();
}

class _GBottomSheetState<T> extends State<GBottomSheet<T>> {
  dynamic selectedItem;

  static const _containerHeight = 312.0;
  static const _mainSize = 16.0;
  static const _iconSize = 16.0;

  @override
  void initState() {
    selectedItem = widget._selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context).theme;
    final _navigator = locateService<INavigationService>();
    return Container(
      height: _containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_mainSize),
        color: _appTheme.colors.secondaryBackground,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: _mainSize,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _mainSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeneralText(
                  widget._bottomSheetTitle,
                  color: _appTheme.colors.defaultText,
                ),
                InkWell(
                  onTap: () => _navigator.pop(),
                  child: Icon(
                    Icons.close,
                    size: _iconSize,
                    color: _appTheme.colors.workspaceIcon,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: _mainSize,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget._list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItem = widget._list[index];
                    });
                    _navigator.pop(selectedItem);
                  },
                  child: _getChild(widget._list[index]),
                );
              },
            ),
          ),
          const SizedBox(
            height: _mainSize,
          )
        ],
      ),
    );
  }

  Widget _getChild(dynamic item) {
    switch (widget._bottomSheetType) {
      case BottomSheetType.dateFormat:
        return BottomSheetDateFormatItem(
          isSelected: selectedItem == item,
          title: item,
        );
      case BottomSheetType.workspace:
        return BottomSheetItem(
          isSelected: selectedItem == item,
          title: item.displayName ?? '',
          subtitle: item.createdBy ?? '',
        );
    }
  }
}
