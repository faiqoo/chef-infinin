import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/home/schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_view.dart';
import '../../../helpers/color_helper.dart';
import '../../../models/perferences/perference_response.dart';
import '../../../services/device/device_service.dart';
import '../../food_product_experience_details/food_product_details_screen_v.dart';
import '../widget/food_details_screen.dart';
import 'food_detail_screen_m.dart';
import 'food_detail_screen_vm.dart';
import '../../../models/home/experience_list_response.dart' as experience_data;

import '../../../setup.dart';

class FoodDetailScreenView extends BaseView<FoodDetailScreenViewModel> {
  FoodDetailScreenView({
    required String selectedExperienceId,
    required experience_data.T experienceData,
    Key? key,
  })  : _selectedExperienceId = selectedExperienceId,
        _experienceData = experienceData,
        super(key: key);

  final String _selectedExperienceId;
  final experience_data.T _experienceData;

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final _appService = locateService<ApplicationService>();
    return BlocBuilder<FoodDetailScreenViewModel, FoodDetailScreenState>(
      bloc: viewModel
        ..getExperienceMenu(
          experienceId: _selectedExperienceId,
        ),
      builder: (_, state) {
        return Scaffold(
            backgroundColor: HexColor.fromHex('#212129'),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: getStartedButtonTitle(context: context),
            // : Container(),
            body: state.when(
              loading: _loading,
              loaded: (foodMenuDetail, scheduleModel) =>
                  displayLoaded(foodMenuDetail, scheduleModel),
            ));
      },
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded(foodMenuDetail, scheduleModel) {
    return FoodDetailScreen(
      foodMenuDetail: foodMenuDetail,
      data: _experienceData,
      scheduleModel: scheduleModel,
      // preferences:preferences,
    );
  }

  Widget getStartedButtonTitle({required BuildContext context}) {
    return GeneralButton.button(
      width: 151,
      title: Strings.nextButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        viewModel.verifyAction(context, _selectedExperienceId, _experienceData);
      },
    );
  }
}
