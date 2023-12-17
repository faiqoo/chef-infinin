import 'dart:convert';

import 'package:chef/models/signup/signup_response.dart';
import 'package:chef/screens/sign_in/sign_in_screen_v.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/enum_helper.dart';
import 'package:chef/models/models.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/ui_kit/helpers/dialog_helper.dart';
import 'package:chef/services/services.dart';
import 'package:chef/models/custom_forms/workflow_v3.dart' as workflow_v3;
import 'package:chef/models/custom_forms/workflow_template_current_step.dart'
    as cs;

import 'dart:developer' as developer;

import '../helpers/order_helper.dart';

class ApplicationState extends Equatable {
  const ApplicationState({
    this.baseUrl,
    this.userInfo,
    this.accessTokenInfo,
    this.tenantId,
    this.orderHelper,
    this.workspaceId,
    this.projectId,
    this.customerTokenLegacy,
    this.userFormData,
    this.workflow,
    this.workspaceList,
    this.selectedNavId,
    this.searchVisible = true,
    this.module,
  });

  // final LoginResponse? userInfo;
  final SignupResponse? userInfo;
  final AccessTokenData? accessTokenInfo;
  final String? tenantId;
  final OrderHelper? orderHelper;
  final String? workspaceId;
  final String? baseUrl;
  final String? projectId;
  final String? customerTokenLegacy;
  final Map<String, dynamic>? userFormData;
  final workflow_v3.Workflow? workflow;
  final List<Workspace>? workspaceList;
  final NavDrawerItem? selectedNavId;
  final bool? searchVisible;
  final Module? module;

  ApplicationState copyWith({
    //LoginResponse? userInfo,
    SignupResponse? userInfo,
    AccessTokenData? accessTokenInfo,
    String? baseUrl,
    String? projectId,
    String? workspaceId,
    String? tenantId,
    // String? scheduleId,
    OrderHelper? orderHelper,
    String? customerTokenLegacy,
    Map<String, dynamic>? userFormData,
    workflow_v3.Workflow? workflow,
    List<Workspace>? workspaceList,
    NavDrawerItem? selectedNavId,
    bool? searchVisible,
    Module? module,
  }) {
    return ApplicationState(
      userInfo: userInfo ?? this.userInfo,
      accessTokenInfo: accessTokenInfo ?? this.accessTokenInfo,
      baseUrl: baseUrl ?? this.baseUrl,
      tenantId: tenantId ?? this.tenantId,
      orderHelper: orderHelper ?? this.orderHelper,
      projectId: projectId ?? this.projectId,
      customerTokenLegacy: customerTokenLegacy ?? this.customerTokenLegacy,
      userFormData: userFormData ?? this.userFormData,
      workflow: workflow ?? this.workflow,
      workspaceId: workspaceId ?? this.workspaceId,
      workspaceList: workspaceList ?? this.workspaceList,
      selectedNavId: selectedNavId ?? this.selectedNavId,
      searchVisible: searchVisible ?? this.searchVisible,
      module: module ?? this.module,
    );
  }

  @override
  List<Object?> get props => [
        userInfo,
        baseUrl,
        tenantId,
        orderHelper,
        projectId,
        customerTokenLegacy,
        userFormData,
        workflow,
        workspaceId,
        workspaceList,
        selectedNavId,
        searchVisible,
        module,
      ];
}

class ApplicationService extends Cubit<ApplicationState> {
  ApplicationService({
    required INavigationService navigation,
    required IStorageService storage,
  })  : _navigation = navigation,
        _storage = storage,
        super(const ApplicationState());

  final INavigationService _navigation;
  final IStorageService _storage;

  Future<void> loadPrefData() async {
    final baseURL = _storage.readString(key: PreferencesKeys.sBaseUrl);
    final loginInfo = _storage.readString(key: PreferencesKeys.sLoginData);
    final _accessTokenInfo =
        _storage.readString(key: PreferencesKeys.sAccessTokenData);
    //final userInfo = LoginResponse.fromJson(jsonDecode(loginInfo));
    final userInfo = SignupResponse.fromJson(jsonDecode(loginInfo));
    var accessTokenInfo = AccessTokenData.empty();
    if (_accessTokenInfo != '') {
      accessTokenInfo = AccessTokenData.fromJson(jsonDecode(_accessTokenInfo));
    }
    final customerTokenLegacy =
        _storage.readString(key: PreferencesKeys.sCustomerTokenLegacy);

    emit(
      state.copyWith(
        baseUrl: baseURL,
        userInfo: userInfo,
        accessTokenInfo: accessTokenInfo,
      ),
    );
  }

  void updateSelectedNavId({required NavDrawerItem id}) {
    emit(state.copyWith(selectedNavId: id));
  }

  void updateNewRecordAttachedFilesList(String id) {
    state.workflow!.documentIds!.add(id);
  }

  void clearNewRecordAttachedFilesList() {
    state.workflow!.documentIds!.clear();
  }

  void updateTenantId(String tenantId) {
    emit(state.copyWith(tenantId: tenantId));
  }

  void updateOrderHelper(OrderHelper orderHelper) {
    emit(state.copyWith(orderHelper: orderHelper));
  }

  void updateWorkspaceId(String workspaceId) {
    emit(state.copyWith(workspaceId: workspaceId));
  }

  void updateCustomerTokenLegacy(String customerTokenLegacy) {
    emit(state.copyWith(customerTokenLegacy: customerTokenLegacy));
  }

  void updateWfInstanceId(String workflowInstanceID) {
    emit(
      state.copyWith(
        workflow: state.workflow!.copyWith(workflowId: workflowInstanceID),
      ),
    );
  }

  void updateAccessToken(AccessTokenData accessTokenInfo) {
    emit(state.copyWith(accessTokenInfo: accessTokenInfo));
  }

  void updateProjectId(String projectId) {
    emit(state.copyWith(projectId: projectId));
  }

  void updateWorkflow(workflow_v3.Workflow updatedWorkflow) {
    emit(state.copyWith(workflow: updatedWorkflow));
  }

  void clearWorkflowRecord() {
    final _wf = state.workflow!.copyWith(record: const Record());
    emit(state.copyWith(workflow: _wf));
  }

  void updateModule(Module module) {
    emit(state.copyWith(module: module));
  }

  void updateWorkflowComment(String txt) {
    final comment = workflow_v3.Comment(text: txt, isPrivate: true);
    final updatedWorkflow = state.workflow!.copyWith(comment: comment);
    emit(state.copyWith(workflow: updatedWorkflow));
  }

  void updateWorkflowData(Map<String, dynamic> formsData) {
    final updatedWorkflow = state.workflow!.copyWith(moduleRecord: formsData);
    emit(state.copyWith(workflow: updatedWorkflow));
  }

  void updateRecordCreatePermission(cs.Permission permission) {
    final workflowPermissions =
        state.workflow!.copyWith(createPermission: permission);
    emit(state.copyWith(workflow: workflowPermissions));
  }

  void updateRecordEditPermission(cs.Permission permission) {
    final workflowPermissions =
        state.workflow!.copyWith(editPermission: permission);
    emit(state.copyWith(workflow: workflowPermissions));
  }

  void updateCurrentStepName(String currentStepName) {
    final workflow = state.workflow!.copyWith(currentStepName: currentStepName);
    emit(state.copyWith(workflow: workflow));
  }

  void updateRecordStatus({bool isActive = true}) {
    final workflow = state.workflow!.copyWith(active: isActive);
    emit(state.copyWith(workflow: workflow));
  }

  void updateRecordActions(List<cs.Action> actions) {
    final workflowActions = state.workflow!.copyWith(actions: actions);
    emit(state.copyWith(workflow: workflowActions));
  }

  void updateFormId(String formId) {
    final workflowFormId = state.workflow!.copyWith(formId: formId);
    emit(state.copyWith(workflow: workflowFormId));
  }

  void updateFormRefId(String formRefId) {
    final workflowFormRefId = state.workflow!.copyWith(formRefId: formRefId);
    emit(state.copyWith(workflow: workflowFormRefId));
  }

  void updateWorkflowId(String workflowId) {
    final workFlow = state.workflow!.copyWith(workflowId: workflowId);
    emit(state.copyWith(workflow: workFlow));
  }

  void updateAllFormData(Map<String, dynamic> formsData) {
    final formData = state.userFormData ?? <String, dynamic>{};
    formData.addAll(formsData);
    emit(state.copyWith(userFormData: formData));
  }

  void updateSearchDisplay({bool? isSearchVisible = true}) {
    emit(state.copyWith(searchVisible: isSearchVisible));
  }

  void clearUserInfo() {
    emit(
      state.copyWith(
        // userInfo: LoginResponse.empty(),
        userInfo: SignupResponse.empty(),
        customerTokenLegacy: '',
        userFormData: {},
        accessTokenInfo: AccessTokenData.empty(),
        baseUrl: '',
        // searchVisible: true,
      ),
    );
  }

  void logout({BuildContext? context}) async {
    clearUserInfo();
    await _storage.clear();
    if (context != null) {
      developer.log(' Sending');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SignInScreen()),
      // );
      _navigation.replaceAll(route: [SignInRoute()]);
    } else {
      _navigation.replaceAll(route: [SignInRoute()]);
    }
  }

  Future<void> fetchWorkspaceList({
    required BuildContext context,
    required INetworkService network,
  }) async {
    try {
      final response = await network.gaurdedGet(
        path: Api.workspaces,
      );

      final workspacesList =
          WorkspaceResponse.fromJson(jsonDecode(response.body)['rows']);

      emit(state.copyWith(workspaceList: workspacesList.workspace));
    } catch (error) {
      Toaster.errorToast(
        context: context,
        message: error.toString(),
      );
      emit(state.copyWith(workspaceList: []));
    }
  }

  Future<bool> logoutPopUp(BuildContext context) async {
    await DialogHelper.confirmationDialog(
      context: context,
      confirmationMessage: Strings.logoutApplication,
      onConfirm: () => logout(),
      onDeny: () {
        _navigation.pop();
        MoveToBackground.moveTaskToBack();
      },
    );
    return Future.value(false);
  }
}
