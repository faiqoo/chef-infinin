import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chef/services/device/device_service.dart';
import 'package:chef/setup.dart';
import 'package:chef/ui_kit/widgets/general_search_bar.dart';
import 'package:chef/base/screen_layout_base/screen_layout_base_m.dart';
import 'package:chef/base/screen_layout_base/screen_layout_base_vm.dart';

mixin ScreenLayoutBase on StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const _mobileSearchbarPadding = 4.0;
  static const _tabletSearchbarPadding = 36.0;

  @override
  Widget build(BuildContext context) {
    return buildScreen(
      context: context,
      screenSizeData: locateService<IDeviceService>().screenSizeData(),
    );
  }

  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final viewModel = locateService<ScreenLayoutBaseViewModel>();

    return BlocBuilder<ScreenLayoutBaseViewModel, ScreenLayoutBaseState>(
      bloc: viewModel..fetchPreSelectedWorkspace(context),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: screenSizeData.screenType == ScreenType.small
                ? _buildMobileView(
                    context: context,
                    screenSizeData: screenSizeData,
                    state: state,
                    viewModel: viewModel,
                  )
                : _buildTabletView(
                    context: context,
                    screenSizeData: screenSizeData,
                    state: state,
                    viewModel: viewModel,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _mobileSearchbarPadding,
        ),
        _extoSearchBar(
          isTablet: false,
          context: context,
          state: state,
          viewModel: viewModel,
        ),
        Expanded(
          child: body(
            context,
            screenSizeData,
          ),
        ),
      ],
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _tabletSearchbarPadding,
        ),
        _extoSearchBar(
          isTablet: true,
          context: context,
          state: state,
          viewModel: viewModel,
        ),
        Expanded(
          child: body(
            context,
            screenSizeData,
          ),
        )
      ],
    );
  }

  Widget _extoSearchBar({
    required bool isTablet,
    required BuildContext context,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return GeneralSearchBar(
      displayHintSearch: viewModel.getSearchVisiblity(),
      onChanged: (value) => onSearchChange(value),
      prefixIconOnTap: () {
        _scaffoldKey.currentState!.openDrawer();
      },
      suffixIconOnTap: () async {
        await suffixIconTap(context);
        viewModel.fetchPreSelectedWorkspace(context);
      },
      selectedWorkspace: state is Loaded ? state.workspace : null,
    );
  }

  Widget body(
    BuildContext context,
    ScreenSizeData screenSizeData,
  );

  Future<void> suffixIconTap(BuildContext context);
  void onSearchChange(String value);
}
