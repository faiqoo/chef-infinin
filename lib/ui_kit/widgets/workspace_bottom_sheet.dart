import 'package:flutter/material.dart';

import 'package:chef/constants/strings.dart';
import 'package:chef/models/workspace.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/ui_kit/widgets/bottom_sheet_item.dart';

class WorkspaceBottomSheet extends StatefulWidget {
  const WorkspaceBottomSheet({
    required List<Workspace> workspaceList,
    required Workspace? selectedWorkspace,
    Key? key,
  })  : _projectList = workspaceList,
        _selectedWorkspace = selectedWorkspace,
        super(key: key);

  final List<Workspace> _projectList;
  final Workspace? _selectedWorkspace;

  @override
  State<WorkspaceBottomSheet> createState() => _WorkspaceBottomSheetState();
}

class _WorkspaceBottomSheetState extends State<WorkspaceBottomSheet> {
  Workspace? selectedItem;

  static const _containerHeight = 312.0;
  static const _mainSize = 16.0;
  static const _iconSize = 16.0;

  @override
  void initState() {
    selectedItem = widget._selectedWorkspace;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Container(
      height: _containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_mainSize),
        color: appTheme.colors.secondaryBackground,
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
                  Strings.chooseWorkspace,
                  color: appTheme.colors.defaultText,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: _iconSize,
                    color: appTheme.colors.workspaceIcon,
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
              itemCount: widget._projectList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItem = widget._projectList[index];
                    });
                    Navigator.pop(context, selectedItem);
                  },
                  child: BottomSheetItem(
                    isSelected: selectedItem == widget._projectList[index],
                    title: widget._projectList[index].displayName ?? '',
                    subtitle: widget._projectList[index].createdBy ?? '',
                  ),
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
}
