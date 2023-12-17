import 'package:chef/screens/food_product_experience_details/widget/food_product_details_summary.dart';
import 'package:chef/screens/home/food_details_menu_model.dart';
import 'package:chef/screens/home/home_screen_v.dart';
import 'package:flutter/material.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../helpers/order_helper.dart';
import '../../helpers/url_helper.dart';
import '../../services/application_state.dart';
import '../../setup.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_button.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../bottom_bar/bottom_bar.dart';
import '../../../models/home/experience_list_response.dart' as experience_data;

import 'dart:developer' as developer;

import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/home/schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_view.dart';
import '../../../helpers/color_helper.dart';
import '../../../services/device/device_service.dart';

import '../../../models/home/experience_list_response.dart' as experience_data;
import 'food_product_details_screen_m.dart';
import 'food_product_details_screen_vm.dart';

class FoodProductExperienceDetailsScreenView
    extends BaseView<FoodProductExperienceDetailsViewModel> {
  FoodProductExperienceDetailsScreenView({
    required String selectedExperienceId,
    required experience_data.T experienceData,
    required FoodMenuModel foodMenuDetail,
    Key? key,
  })  : _selectedExperienceId = selectedExperienceId,
        _experienceData = experienceData,
        _foodMenuDetail = foodMenuDetail,
        super(key: key);

  final String _selectedExperienceId;
  final experience_data.T _experienceData;
  final FoodMenuModel _foodMenuDetail;

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    return BlocBuilder<FoodProductExperienceDetailsViewModel,
        FoodProductDetailScreenState>(
      bloc: viewModel..defaultState(),
      builder: (_, state) {
        return Scaffold(
            backgroundColor: HexColor.fromHex('#212129'),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: getStartedButtonTitle(context: context),
            body: state.when(
              loading: _loading,
              loaded: () => displayLoaded(),
            ));
      },
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded() {
    return FoodProductDetailsSummary(
      experienceData: _experienceData,
      selectedExperienceId: _selectedExperienceId,
      foodMenuDetail: _foodMenuDetail,
    );
  }

  Widget getStartedButtonTitle({required BuildContext context}) {
    return GeneralButton.button(
      width: 230,
      title: Strings.productDetailButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        developer.log(' Ready to submit data ');
        viewModel.submitBooking(context, _experienceData);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => FoodProductExperienceDetails(
        //         experienceData: _experienceData,
        //         selectedExperienceId: _selectedExperienceId,
        //         foodMenuDetail: viewModel.foodMenuData,
        //       )),
        // );
      },
    );
  }
}
