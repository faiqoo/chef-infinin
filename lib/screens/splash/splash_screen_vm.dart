import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/preferences.dart';
import 'package:chef/models/models.dart';
import 'package:chef/screens/splash/splash_screen_m.dart';
import 'package:chef/services/services.dart';
import 'package:chef/helpers/enum_helper.dart';

@injectable
class SplashScreenViewModel extends BaseViewModel<SplashScreenState> {
  SplashScreenViewModel({
    required INavigationService navigationService,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigationService = navigationService,
        _storage = storage,
        _appService = appService,
        super(const Initialized());

  final INavigationService _navigationService;
  final IStorageService _storage;
  final ApplicationService _appService;

  void fetchLoginDetails(BuildContext context) async {
    try {
      final userInfo = _storage.readString(key: PreferencesKeys.sLoginData);
      final rememberUser =
          _storage.readBool(key: PreferencesKeys.sRememberUser);
      if (rememberUser && userInfo.isNotEmpty) {
        final authData = LoginResponse.fromJson(jsonDecode(userInfo));
        // navigateToPage(authData);
      } else {
        //   _appService.logout();
      }
    } catch (error) {
      //     navigateToSignUp();
    }
  }

  void navigateToPage(LoginResponse authData) async {
    await _appService.loadPrefData();
    if (authData.user.tenantId.isNotEmpty) {
      final customerId = _storage.readString(key: PreferencesKeys.sCustomerId);
      if (customerId.isNotEmpty) {
        final workspaceId =
            _storage.readString(key: PreferencesKeys.sWorkspaceId);
        if (workspaceId.isNotEmpty) {
          final projectId = _storage.readString(key: PreferencesKeys.projectId);
          if (projectId.isNotEmpty) {
            _appService.updateSearchDisplay(isSearchVisible: false);
            _appService.updateSelectedNavId(id: NavDrawerItem.home);
            //  _navigationService.replace(route: HomeRoute());
          } else {
            _appService.updateSelectedNavId(id: NavDrawerItem.projects);
          }
        } else {
          _appService.updateSelectedNavId(id: NavDrawerItem.workspace);
          //   _navigationService.replace(route: WorkspaceRoute());
        }
      } else {
        // _navigationService.replace(route: CustomerRoute());
      }
    } else {
      // _navigationService.replace(route: LoginRoute());
    }
  }

  // void navigateToLogin() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     _navigationService.replace(route: LoginRoute());
  //   });
  // }

  void navigateToSignUp() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigationService.replace(route: SignUpRoute());
    });
  }
}
