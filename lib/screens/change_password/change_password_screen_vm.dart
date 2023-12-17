import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/change_password/change_password_screen_m.dart';

@injectable
class ChangePasswordScreenViewModel
    extends BaseViewModel<ChangePasswordScreenState> {
  ChangePasswordScreenViewModel({
    required INavigationService navigation,
  })  : _navigation = navigation,
        super(const Initialized());

  final INavigationService _navigation;

  void updateCurrentPasswordField(String currentPassword) {
    emit(
      state.copyWith(
        currentPassword: currentPassword,
        newPassword: state.newPassword,
        confirmPassword: state.confirmPassword,
      ),
    );
  }

  void updateNewPasswordFields({
    String? newPassword,
    String? confirmPassword,
    bool validate = false,
  }) {
    var hasError = validate &&
        (newPassword ?? state.newPassword) !=
            (confirmPassword ?? state.confirmPassword);
    var errorMessage = hasError ? Strings.passwordMismatch : '';
    emit(
      state.copyWith(
        currentPassword: state.currentPassword,
        newPassword: newPassword ?? state.newPassword,
        confirmPassword: confirmPassword ?? state.confirmPassword,
        errorMessage: errorMessage,
        isApiError: false,
      ),
    );
  }

  void updatePassword() => emit(
        state.copyWith(
          currentPassword: state.currentPassword,
          newPassword: state.newPassword,
          confirmPassword: state.confirmPassword,
          isApiError: true,
          errorMessage: Strings.passwordMismatch,
        ),
      );

  void pop() => _navigation.pop();
}
