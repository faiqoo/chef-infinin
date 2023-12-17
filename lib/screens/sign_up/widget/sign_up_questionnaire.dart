

import 'package:chef/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../models/signup/sign_up_questionnaire_response_model.dart';
import '../../../theme/app_theme_data/app_theme_data.dart';
import '../../../ui_kit/widgets/general_text.dart';




class SignUpQuestionnaire extends StatefulWidget {
  const SignUpQuestionnaire({Key? key,required this.signUpQuestionsModel}) : super(key: key);

  final SignUpQuestionsModel signUpQuestionsModel;

  @override
  State<SignUpQuestionnaire> createState() => _SignUpQuestionnaireState();
}

class _SignUpQuestionnaireState extends State<SignUpQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 260,
            width: double.infinity,
            child: Image.asset(Resources.getSignUpQuestionireBgPng,fit: BoxFit.fill,),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Container(
                alignment: Alignment.center,
                //  padding: const EdgeInsets.only(left: 29),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeneralText(
                      Strings.questionireLabel,
                      textAlign: TextAlign.center,
                      style: appTheme.typographies.interFontFamily.headline4
                          .copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    getQuestionWigetsList(widget.signUpQuestionsModel,appTheme,context),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GeneralText(
                            Strings.labelProfilePicture,
                            textAlign: TextAlign.center,
                            style: appTheme.typographies.interFontFamily.headline4
                                .copyWith(
                                color: appTheme.colors.primaryBackground,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.asset(
                            Resources.userProfilePicPng,
                            height: 47,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }


  List<Widget> getChipsWigetsList(SignUpQuestionsModel viewModel, IAppThemeData appTheme, List<Answers>? answers, BuildContext context){
    return List.generate(answers?.length??0, (index) {
      var item = answers![index];
      return  InkWell(onTap: (){
      var currentItemSelectedStatus = item.isSelected;
      // for (var element in answers) {
      //   if(element.id==item.id){
      //     item.isSelected = !currentItemSelectedStatus!;
      //   }else{
      //     element.isSelected=false;}
      // }
      item.isSelected = !currentItemSelectedStatus!;
      setState((){});
    },child: ChipsWidget(
      appTheme: appTheme,
      title: item.name??'',
      selected: item.isSelected??false,
    ),);}


    );
  }


  Widget getQuestionWigetsList(
      SignUpQuestionsModel model, IAppThemeData appTheme, BuildContext context) {
    return ListView.builder(physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.t?.length,
      itemBuilder: (ctx, index) {
        var item = model.t![index];
        return Padding(padding: const EdgeInsetsDirectional.only(top: 40,start: 20, end: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                item.name??'',
                textAlign: TextAlign.center,
                style: appTheme
                    .typographies.interFontFamily.headline4
                    .copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: getChipsWigetsList(model, appTheme,item.answers,context)
                ,
              ),
            ],
          ),
        );
      },
    );
  }
}






class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    Key? key,
    required this.appTheme,
    required this.title,
    this.selected = false,
    this.widthContainer = 140,
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
