import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/username_profile/profile_information_screen_m.dart';

@injectable
class ProfileInformationScreenViewModel
    extends BaseViewModel<ProfileInformationScreenState> {
  ProfileInformationScreenViewModel({
    required INavigationService navigation,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _appService = appService,
        super(Initialized(User.empty()));

  final INavigationService _navigation;
  final ApplicationService _appService;

  // void fetchUserData() =>
  //  //   emit(state.copyWith(user: _appService.state.userInfo?.user));
  // emit(state.copyWith(user: (_appService.state.userInfo?.t)));
  void fetchUserData() => ({});

  void pop() => _navigation.pop();
}
