import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/device/device_service.dart';
import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/ui_kit/helpers/dialog_helper.dart';
import 'package:chef/screens/account_settings/account_settings_screen_m.dart';
import 'package:chef/screens/account_settings/account_settings_screen_vm.dart';

class AccountSettingsScreen extends BaseView<AccountSettingsScreenViewModel> {
  AccountSettingsScreen({Key? key}) : super(key: key);

  final _dateFormatOptions = [
    'dd/MMM/yyyy',
    'MMM/dd/yy',
    'dd/MM/yyyy',
    'MM/dd/yyyy',
    'MM/dd/yy',
    'MMM/dd',
    'MM/dd',
  ];

  static const _mobilePadding = 24.0;
  static const _tabPadding = 48.0;
  static const _size16 = 16.0;
  static const _size12 = 12.0;

  static const _appBarPadding = 33.0;
  static const _colorOpacity = 0.04;

  final _sizedBox12 = const SizedBox(
    height: _size12,
  );

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AccountSettingsScreenViewModel,
            AccountSettingsScreenState>(
          bloc: viewModel,
          builder: (_, state) {
            return screenSizeData.screenType == ScreenType.small
                ? _mobileView(
                    context: context,
                    appTheme: appTheme,
                    state: state,
                  )
                : _tabletView(
                    appTheme: appTheme,
                    state: state,
                  );
          },
        ),
      ),
    );
  }

  Widget _mobileView({
    required BuildContext context,
    required IAppThemeData appTheme,
    required AccountSettingsScreenState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _appBarPadding,
        ),
        GeneralProfileAppBar(
          title: Strings.accountSettings,
          onClick: () => viewModel.pop(),
        ),
        const SizedBox(
          height: _appBarPadding,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: _mobilePadding),
              child: Column(
                children: [
                  _divider(appTheme: appTheme),
                  _mobileItem(
                    title: Strings.theme,
                    appTheme: appTheme,
                    value: Strings.lightTheme,
                  ),
                  _divider(appTheme: appTheme),
                  InkWell(
                    onTap: () => viewModel.showBottomSheet(
                      bottomSheet: _showBottomSheet(context),
                    ),
                    child: _mobileItem(
                      title: Strings.dateFormat,
                      appTheme: appTheme,
                      value: viewModel.getSelectedFormat(),
                    ),
                  ),
                  _divider(appTheme: appTheme),
                  _mobileItem(
                    title: Strings.fontSize,
                    appTheme: appTheme,
                    value: Strings.mediumFontSize,
                  ),
                  _divider(appTheme: appTheme),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _tabletView({
    required IAppThemeData appTheme,
    required AccountSettingsScreenState state,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: _tabPadding,
          ),
          _tabletItem(
            title: Strings.theme,
            appTheme: appTheme,
          ),
          _sizedBox12,
          _divider(appTheme: appTheme, isTablet: true),
          _sizedBox12,
          _tabletExpansionTile(
            title: Strings.dateFormat,
            appTheme: appTheme,
            state: state,
          ),
          _sizedBox12,
          _divider(appTheme: appTheme, isTablet: true),
          _sizedBox12,
          _tabletItem(
            title: Strings.fontSize,
            appTheme: appTheme,
          ),
          _sizedBox12,
        ],
      ),
    );
  }

  Widget _tabletItem({required String title, required IAppThemeData appTheme}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _tabPadding,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: GeneralText(
          title,
          style: appTheme.typographies.interFontFamily.headline4
              .copyWith(color: appTheme.colors.searchBorder),
        ),
        trailing: const Icon(Icons.expand_more),
      ),
    );
  }

  Widget _divider({
    required IAppThemeData appTheme,
    bool isTablet = false,
  }) {
    return Padding(
      padding: isTablet
          ? const EdgeInsets.only(left: _tabPadding)
          : const EdgeInsets.symmetric(horizontal: _mobilePadding),
      child: GeneralDivider(
        color: appTheme.colors.primary.withOpacity(_colorOpacity),
      ),
    );
  }

  Widget _tabletExpansionTile({
    required String title,
    required IAppThemeData appTheme,
    required AccountSettingsScreenState state,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _tabPadding,
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: appTheme.colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          iconColor: appTheme.colors.primary,
          collapsedIconColor: appTheme.colors.defaultTrailingIcon,
          initiallyExpanded: true,
          title: GeneralText(
            title,
            style: appTheme.typographies.interFontFamily.headline4
                .copyWith(color: appTheme.colors.searchBorder),
          ),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    GeneralText(
                      Strings.chooseDateFormat,
                      style: appTheme.typographies.interFontFamily.body2M,
                    ),
                    const Spacer(),
                    GeneralText(
                      viewModel.getCurrentDate(),
                      style: appTheme.typographies.interFontFamily.body1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: _size16,
                ),
                Container(
                  decoration: appTheme.containerDecoration,
                  padding: const EdgeInsets.all(_size16),
                  child: ListView.builder(
                    itemCount: _dateFormatOptions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final _isSelected = viewModel.getSelectedFormat() ==
                          _dateFormatOptions[index];
                      final _selectedStyle = appTheme
                          .typographies.interFontFamily.body1
                          .copyWith(color: appTheme.colors.secondaryBackground);
                      final _unselectedStyle = appTheme
                          .typographies.interFontFamily.body1
                          .copyWith(color: appTheme.colors.disabledText);
                      return Container(
                        decoration: _isSelected
                            ? appTheme.selectedContainerDecoration
                            : null,
                        child: ListTile(
                          onTap: () => viewModel
                              .updateDateFormat(_dateFormatOptions[index]),
                          title: GeneralText(
                            _dateFormatOptions[index],
                            style:
                                _isSelected ? _selectedStyle : _unselectedStyle,
                          ),
                          trailing: _isSelected
                              ? Icon(
                                  Icons.done,
                                  color: appTheme.colors.secondaryBackground,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _mobileItem({
    required String title,
    required IAppThemeData appTheme,
    required String value,
  }) {
    return ListTile(
      title: GeneralText(
        title,
        style: appTheme.typographies.interFontFamily.body2M
            .copyWith(color: appTheme.colors.mainBlack100),
      ),
      trailing: GeneralRichText(
        title: value,
        icon: Icon(
          Icons.chevron_right_sharp,
          color: appTheme.colors.tertiaryText,
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context) async {
    return DialogHelper.showBottomSheetDialog(
      context: context,
      body: GBottomSheet<String>(
        bottomSheetTitle: Strings.chooseDateFormat,
        list: _dateFormatOptions,
        selectedItem: viewModel.getSelectedFormat(),
        bottomSheetType: BottomSheetType.dateFormat,
      ),
    );
  }
}
