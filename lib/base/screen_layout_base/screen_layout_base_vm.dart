import 'package:chef/helpers/helpers.dart';

import 'package:chef/base/screen_layout_base/screen_layout_base_m.dart'
    as screenM;

@injectable
class ScreenLayoutBaseViewModel
    extends BaseViewModel<screenM.ScreenLayoutBaseState> {
  ScreenLayoutBaseViewModel({
    required ApplicationService appService,
    required IStorageService storage,
    required WorkspaceHelper workspaceHelper,
  })  : _appService = appService,
        _storage = storage,
        _workspaceHelper = workspaceHelper,
        super(const screenM.Initialized());

  final ApplicationService _appService;
  final IStorageService _storage;
  final WorkspaceHelper _workspaceHelper;

  void fetchPreSelectedWorkspace(BuildContext context) async {
    final workspace = _workspaceHelper.fetchPreSelectedWorkspace(
      workspaceList: _appService.state.workspaceList ?? [],
      context: context,
      storage: _storage,
    );
    emit(screenM.Loaded(workspace));
  }

  bool? getSearchVisiblity() => _appService.state.searchVisible;
}
