

import 'package:chef/base/base.dart';
import 'package:chef/models/signup/sign_up_questionnaire_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_questionire_screen_m.freezed.dart';

@freezed
class SignUpQuestionnaireState extends BaseState with _$SignUpQuestionnaireState {
  const factory SignUpQuestionnaireState.loading() = Loading;
  const factory SignUpQuestionnaireState.loaded(
      SignUpQuestionsModel signUpQuestionsModel) = Loaded;
}

