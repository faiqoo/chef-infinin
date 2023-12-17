import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/screens/forgot_password/forgot_password_screen_m.dart';
import 'package:chef/services/services.dart';
import 'package:chef/constants/constants.dart';

@injectable
class ForgotPasswordScreenViewModel
    extends BaseViewModel<ForgotPasswordScreenState> {
  ForgotPasswordScreenViewModel({
    required INavigationService navigation,
  })  : _navigation = navigation,
        super(
          const Initialized(
            email: '',
            isBusy: false,
          ),
        );

  final INavigationService _navigation;

  void onFormValuesChange({
    String? email,
  }) {
    emit(
      state.copyWith(
        email: email ?? state.email,
      ),
    );
  }

  void forgotPassword({
    required String email,
    required String baseUrl,
    required BuildContext context,
  }) async {
    emit(state.copyWith(isBusy: true));
    Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(
          state.copyWith(isBusy: false, errorMessage: Strings.unknownError),
        );
      },
    );
  }

  void pop() {
    _navigation.pop();
  }
}
