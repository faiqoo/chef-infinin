import 'package:chef/helpers/helpers.dart';

import 'edit_profile_screen_m.dart';

@injectable
class EditProfileScreenViewModel extends BaseViewModel<EditProfileScreenState> {
  EditProfileScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(
          const Initialized(
            mobileNumber: '',
            isBusy: false,
          ),
        );

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  void logout(BuildContext context) => _appService.logout(context: context);
}
