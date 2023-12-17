import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:chef/constants/preferences.dart';
import 'package:chef/models/workspace.dart';
import 'package:chef/services/application_state.dart';
import 'package:chef/services/storage/storage_service.dart';
import 'package:chef/ui_kit/helpers/toaster_helper.dart';

@injectable
class WorkspaceHelper {
  WorkspaceHelper({
    required IStorageService storage,
    required ApplicationService appService,
  })  : _storage = storage,
        _appService = appService;

  final IStorageService _storage;
  final ApplicationService _appService;

  void saveWorkspaceId({
    required BuildContext context,
    required Workspace workspace,
  }) async {
    try {
      await _storage.writeString(
        key: PreferencesKeys.sWorkspaceId,
        data: workspace.refId!,
      );
      _appService.updateWorkspaceId(workspace.refId!);
    } catch (error) {
      Toaster.errorToast(
        context: context,
        message: error.toString(),
      );
      return;
    }
  }

  String fetchSelectedWorkspaceId({
    required BuildContext context,
  }) {
    try {
      var _workspaceId = _storage.readString(key: PreferencesKeys.sWorkspaceId);
      return _workspaceId;
    } catch (error) {
      Toaster.errorToast(
        context: context,
        message: error.toString(),
      );
      return '';
    }
  }

  Workspace? fetchPreSelectedWorkspace({
    required List<Workspace> workspaceList,
    required BuildContext context,
    required IStorageService storage,
  }) {
    Workspace? preSelectedWorkspace;
    final refId = fetchSelectedWorkspaceId(context: context);
    for (var element in workspaceList) {
      if (element.refId == refId) {
        preSelectedWorkspace = element;
      }
    }
    return preSelectedWorkspace;
  }
}
