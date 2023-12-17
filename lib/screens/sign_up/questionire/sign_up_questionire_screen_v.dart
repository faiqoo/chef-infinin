import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/sign_up/questionire/sign_up_questionire_screen_m.dart';
import 'package:chef/screens/sign_up/questionire/sign_up_questionire_screen_vm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/sign_up_questionnaire.dart';




class SignUpQuestionireScreen extends BaseView<SignUpQuestionnaireScreenViewModel> {
  SignUpQuestionireScreen({Key? key}) : super(key: key);


  @override
  Widget buildScreen({required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<SignUpQuestionnaireScreenViewModel,
        SignUpQuestionnaireState>(
        bloc: viewModel..getQuestionnaireData(userId: '45'),
        builder: (context, state) {
          return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 18.0, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpLetsStartScreen()),
                );
              },
              child: SvgPicture.asset(
                Resources.getSignInRightArrow,
              ),
            ),
          ],
        ),
      ),


      body: state.when(loading: _loading, loaded: (signUpQuestionsModel) => displayLoaded(signUpQuestionsModel)),
      );
  });
  }


  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded(signUpQuestionsModel) {
    return SignUpQuestionnaire(signUpQuestionsModel: signUpQuestionsModel);
  }

}

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    Key? key,
    required this.appTheme,
    required this.title,
    this.selected = false,
    this.widthContainer = 160,
  }) : super(key: key);

  final IAppThemeData appTheme;
  final String title;
  final bool selected;
  final double widthContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        width: widthContainer,
        child: GeneralText(
          title.capitalize(),
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: selected ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: selected ? FontWeight.bold : FontWeight.w500),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: appTheme.colors.textFieldBorderColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
          color: selected
              ? appTheme.colors.textFieldBorderColor
              : Colors.transparent,
        ));
  }
}
