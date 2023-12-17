import 'package:flutter/material.dart';

import 'package:chef/base/responsive_view.dart';
import 'package:chef/constants/strings.dart';
import 'package:chef/helpers/string_helper.dart';
import 'package:chef/models/workspace.dart';
import 'package:chef/services/device/device_service.dart';
import 'package:chef/setup.dart';
import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class GeneralSearchBar extends ResponsiveWidget {
  GeneralSearchBar({
    required VoidCallback prefixIconOnTap,
    required Function(String) onChanged,
    required VoidCallback suffixIconOnTap,
    bool? displayHintSearch = true,
    Workspace? selectedWorkspace,
    Key? key,
  })  : _onChanged = onChanged,
        _suffixIconOnTap = suffixIconOnTap,
        _prefixIconOnTap = prefixIconOnTap,
        _selectedWorkspace = selectedWorkspace,
        _displayHintSearch = displayHintSearch,
        super(
          key: key,
          deviceService: locateService<IDeviceService>(),
        );

  final Function(String) _onChanged;
  final VoidCallback _suffixIconOnTap;
  final VoidCallback _prefixIconOnTap;
  final Workspace? _selectedWorkspace;
  final bool? _displayHintSearch;

  static const _tabletPadding = 60.0;
  static const _mobilePadding = 16.0;
  static const _topMobilePadding = 23.0;
  static const _topTabletPadding = 36.0;
  static const _borderRadius = 8.0;
  static const _inputOpacity = 0.5;
  static const _mobileSuffixPadding = 14.5;
  static const _tabletSuffixPadding = 19.5;
  static const _horizontalContentPadding = 16.0;
  static const _searchFieldHeight = 40.0;
  static const _tabletPrefixLeftPadding = 20.5;
  static const _tabletPrefixRightPadding = 11.5;
  static const _mobilePrefixRightPadding = 10.5;
  static const _workContainerWidth = 70.0;
  static const _workContainerPadding = 8.0;
  static const _workContainerMargin = 4.0;
  static const _workContainerBorderRadius = 5.0;
  static const _workIconSize = 20.0;
  static const _workIconBottomMargin = 6.5;

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    final isTablet = screenSizeData.screenType != ScreenType.small;
    return Padding(
      padding: EdgeInsets.only(
        left: isTablet ? _tabletPadding : _mobilePadding,
        right: isTablet ? _tabletPadding : _mobilePadding,
        top: isTablet ? _topTabletPadding : _topMobilePadding,
      ),
      child: Container(
        height: _searchFieldHeight,
        decoration: BoxDecoration(
          color: appTheme.colors.secondaryBackground,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: _displayHintSearch != null && !_displayHintSearch!
            ? displayWithoutSearch(appTheme, isTablet)
            : displayTextField(appTheme, isTablet),
      ),
    );
  }

  Widget displayTextField(appTheme, isTablet) {
    return TextField(
      onChanged: _onChanged,
      decoration: InputDecoration(
        alignLabelWithHint: false,
        border: InputBorder.none,
        hintText: _displayHintSearch != null && !_displayHintSearch!
            ? ''
            : Strings.searchHintText,
        hintStyle: appTheme.typographies.interFontFamily.body2R.copyWith(
          color: appTheme.colors.searchBorder.withOpacity(_inputOpacity),
        ),
        suffixIcon: InkWell(
          onTap: _suffixIconOnTap,
          child: _selectedWorkspace == null
              ? Padding(
                  child: Icon(
                    Icons.work_outline,
                    color: appTheme.colors.workspaceIcon,
                  ),
                  padding: EdgeInsets.only(
                    right:
                        isTablet ? _tabletSuffixPadding : _mobileSuffixPadding,
                  ),
                )
              : Container(
                  width: _workContainerWidth,
                  margin: const EdgeInsets.all(_workContainerMargin),
                  padding: const EdgeInsets.all(_workContainerPadding),
                  decoration: BoxDecoration(
                    color: appTheme.colors.selectedBottomSheetItem,
                    borderRadius:
                        BorderRadius.circular(_workContainerBorderRadius),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.work,
                          size: _workIconSize,
                          color: appTheme.colors.secondaryBackground,
                        ),
                      ),
                      const SizedBox(
                        width: _workIconBottomMargin,
                      ),
                      Expanded(
                        child: GeneralText(
                          (_selectedWorkspace?.displayName ?? '')
                              .getShortName(),
                          typography: TypographyFamily.label4,
                          color: appTheme.colors.secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        prefixIcon: InkWell(
          onTap: _prefixIconOnTap,
          child: Padding(
            child: Icon(
              Icons.list,
              color: appTheme.colors.workspaceIcon,
            ),
            padding: EdgeInsets.only(
              left: isTablet ? _tabletPrefixLeftPadding : _mobileSuffixPadding,
              right: isTablet
                  ? _tabletPrefixRightPadding
                  : _mobilePrefixRightPadding,
            ),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: _horizontalContentPadding,
          vertical: _borderRadius,
        ),
        enabledBorder: appTheme.searchbarBorder,
        focusedBorder: appTheme.searchbarBorder,
      ),
    );
  }

  Widget displayWithoutSearch(appTheme, isTablet) {
    return Row(
      children: [
        InkWell(
          onTap: _prefixIconOnTap,
          child: Padding(
            child: Icon(
              Icons.list,
              color: appTheme.colors.workspaceIcon,
            ),
            padding: EdgeInsets.only(
              left: isTablet ? _tabletPrefixLeftPadding : _mobileSuffixPadding,
              right: isTablet
                  ? _tabletPrefixRightPadding
                  : _mobilePrefixRightPadding,
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: _suffixIconOnTap,
          child: _selectedWorkspace == null
              ? Padding(
                  child: Icon(
                    Icons.work_outline,
                    color: appTheme.colors.workspaceIcon,
                  ),
                  padding: EdgeInsets.only(
                    right:
                        isTablet ? _tabletSuffixPadding : _mobileSuffixPadding,
                  ),
                )
              : Container(
                  width: _workContainerWidth,
                  margin: const EdgeInsets.all(_workContainerMargin),
                  padding: const EdgeInsets.all(_workContainerPadding),
                  decoration: BoxDecoration(
                    color: appTheme.colors.selectedBottomSheetItem,
                    borderRadius:
                        BorderRadius.circular(_workContainerBorderRadius),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.work,
                          size: _workIconSize,
                          color: appTheme.colors.secondaryBackground,
                        ),
                      ),
                      const SizedBox(
                        width: _workIconBottomMargin,
                      ),
                      Expanded(
                        child: GeneralText(
                          (_selectedWorkspace?.displayName ?? '')
                              .getShortName(),
                          typography: TypographyFamily.label4,
                          color: appTheme.colors.secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
