import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/enum_helper.dart';
import 'package:chef/models/home_screen_model.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/home/home_screen_m.dart';

import '../../helpers/url_helper.dart';
import '../../models/home/experience_list_response.dart';
import '../../ui_kit/helpers/toaster_helper.dart';
import 'dart:developer' as developer;
import '../../helpers/data_request.dart' as data_request;

import 'package:chef/models/signup/profession_request.dart' as prorequest;

import 'package:chef/models/home/food_menu_request.dart' as menurequest;

import 'food_details_menu_model.dart';

@injectable
class HomeScreenViewModel extends BaseViewModel<HomeScreenState> {
  HomeScreenViewModel({
    required INavigationService navigation,
    required IStorageService storage,
    required ApplicationService appService,
    required INetworkService network,
  })  : _navigation = navigation,
        _storage = storage,
        _appService = appService,
        _network = network,
        super(
          const Initialized(),
        );

  final INavigationService _navigation;
  final IStorageService _storage;
  final ApplicationService _appService;
  final INetworkService _network;

  HomeScreenModel getUserInfo() {
    final projectName = _storage.readString(key: PreferencesKeys.projectName);
    final customerName = _storage.readString(key: PreferencesKeys.customerName);
    final customerLogo = _storage.readString(key: PreferencesKeys.customerLogo);
    final _bytesImage = const Base64Decoder().convert(
      _storage.readString(
        key: PreferencesKeys.customerLogo,
      ),
    );
    return HomeScreenModel(
      customerImage: _bytesImage,
      customerLogo: customerLogo,
      customerName: customerName,
      projectName: projectName,
    );
  }

  void loadData() {
    // emit(const Loaded());
  }

  void fetchData({
    required BuildContext context,
  }) async {
    //   loading(isBusy: true);
    emit(const Loading());
    try {
      final url =
          InfininURLHelpers.getRestApiURL(Api.baseURL + Api.experienceList);
      data_request.T t = data_request.T();

      final dataRequest = data_request.DataRequest(
        t: t,
      ).toJson();
      final response = await _network
          .post(
            path: url,
            data: dataRequest,
            //   accessToken: false,
          )
          .whenComplete(() {});

      // final response = await _network.get(
      //   //below one is working
      //   path: 'https://run.mocky.io/v3/80289cbe-aa47-491e-9eb2-56126289c8a4',
      // );
      if (response != null) {
        developer.log(' Response experience is ' + '${response.body}');

        ExperienceListResponse experienceListResponse =
            experienceListResponseFromJson(response.body);
        developer.log(' experienceListResponse up Response is ' +
            '${experienceListResponse.code}');
        // getExperienceMenu(
        //   experienceListResponse: experienceListResponse,
        // );
        emit(Loaded(experienceListResponse));
      } else {
        Toaster.infoToast(
            context: context,
            message: 'Something is wrong please content vendor');
        developer.log(' Response of Signup is null ' + '$response');
      }

      //  loading(isBusy: false);
      //   _navigation.replace(route: CustomerRoute());
    } catch (error) {
      // emit(
      //   // state.copyWith(
      //   //   isBusy: false,
      //   //   errorMessage: error.toString().contains(Api.unauthorizedRequest)
      //   //       ? Strings.invalidUsernamePassword
      //   //       : error.toString(),
      //   // ),
      // );
    }
    // }
  }

  Future<void> getExperienceMenu({
    required ExperienceListResponse experienceListResponse,
  }) async {
    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.experienceMenu);
    // emit(const Loading());

    //  emit(const Loading());

    final foodMenuRequest = menurequest.FoodMenuRequest(
      t: 8,
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    final foodMenuData = foodMenuModelFromJson(response.body);
    emit(Loaded(experienceListResponse));

    // List<ProfessionData> data = currentProfessionData.t;
    // emit(Loaded(currentProfessionData));
  }

  void navigateToProjectScreen() async {
    //_navigation.replace(route: ProjectsRoute());
  }

  void navigateToCustomerScreen() async {
    //_navigation.replace(route: CustomerRoute());
  }

  void navigateToDashboardScreen() async {
    // _navigation.replace(route: DashboardRoute());
  }

  void navigateToModulesScreen() async {
    _appService.updateSearchDisplay();
    _appService.updateSelectedNavId(id: NavDrawerItem.module);
    //  _navigation.replace(route: ModulesRoute());
  }

  Future<bool> logoutPopUp(BuildContext context) async =>
      _appService.logoutPopUp(context);
}
