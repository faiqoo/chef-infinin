
import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/models/signup/sign_up_questionnaire_request.dart' as baserequest;
import 'package:chef/models/signup/sign_up_questionnaire_response_model.dart';
import 'package:chef/screens/sign_up/questionire/sign_up_questionire_screen_m.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/api.dart';

@injectable
class  SignUpQuestionnaireScreenViewModel extends BaseViewModel<SignUpQuestionnaireState> {
  SignUpQuestionnaireScreenViewModel({
    required INetworkService network,
}) : _network = network, super(const Loading());


  final INetworkService _network;

  late SignUpQuestionsModel signUpQuestionsModel;

  Future<void> getQuestionnaireData({required String userId}) async {
    final url =
    InfininURLHelpers.getRestApiURL(Api.baseURL + Api.singUpQuestionnaireList);

    emit(const Loading());

    final signUpQuestionnaireRequest = baserequest.SignUpQuestionsRequest(
      t: baserequest.T(userId: int.parse(userId)),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: signUpQuestionnaireRequest,
    );

    signUpQuestionsModel = signUpQuestionsModelFromJson(response.body);
    debugPrint("${response.body}");

    response.body != "" || response.body != null ?  emit(Loaded(signUpQuestionsModel)) : emit(const Loading());
  }
}