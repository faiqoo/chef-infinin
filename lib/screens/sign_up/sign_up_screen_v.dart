import 'dart:developer';

import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/sign_up/pin_input_field.dart';
import 'package:chef/screens/sign_up/sign_up_screen_vm.dart';
import 'package:chef/screens/sign_up/verify_phone_number.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../models/signup/profession_response.dart';
import '../../ui_kit/helpers/dialog_helper.dart';
import '../../ui_kit/widgets/general_gender.dart';
import '../sign_in/sign_in_screen_v.dart';
import 'get_started_screen_vm.dart';
import 'package:chef/screens/sign_up/sign_up_screen_m.dart';

import 'dart:developer' as developer;

class SignUpScreen extends BaseView<SignUpScreenViewModel> {
  SignUpScreen({isVerified, Key? key}) : super(key: key);

  final baseURLs = [
    // Api.prodURL,
    Api.baseURL,
    Api.devBaseURL,
  ];

  late List<DropdownMenuItem<String>> items = [];


  Gender selectedGender = Gender.male;

  final genderList = <String>['Male', 'Female'];

  late final ScrollController scrollController = ScrollController();
  bool isKeyboardVisible = false;

  BuildContext? dcontext;

  void loadProfessionList(
    List<ProfessionData> professionList,
  ) {
    for (int i = 0; i < professionList.length; i++) {
      viewModel.dropdownDetails[professionList[i].name] = professionList[i].id;
      if (!viewModel.dropdownItems.contains(professionList[i].name)) {
        viewModel.dropdownItems.add(professionList[i].name);
      }
    }
    viewModel.professionID =
        viewModel.dropdownDetails[viewModel.dropdownItems[0]];

    if(viewModel.checkAllInputAdded()){
      viewModel.changeButton(true);
    }else{
      viewModel.changeButton(false);
    }
  }

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<SignUpScreenViewModel, SignUpScreenState>(
        bloc: viewModel
          ..loadProfessions(baseUrl: baseURLs[0], context: context),
        builder: (_, state) {
          return Scaffold(
              backgroundColor: appTheme.colors.primaryBackground,
              bottomNavigationBar: displayAlreadySignIn(appTheme, context),
              body: state.when(
                  loading: _loading,
                  loaded: (professionList) => _displayLoadedData(
                      state: state,
                      appTheme: appTheme,
                      context: context,
                      professionList: professionList,
                      screenSizeData: screenSizeData)));
        });
  }

  Widget _loading() => const GeneralLoading();

  Widget _displayLoadedData({
    state,
    appTheme,
    required BuildContext context,
    required List<ProfessionData> professionList,
    required ScreenSizeData screenSizeData,
  }) {
    final size = screenSizeData.size;
    dcontext = context;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: [
                screenSizeData.screenType == ScreenType.small
                    ? _buildMobileView(
                        context: context,
                        state: state,
                        appTheme: appTheme,
                        size: size,
                        professionList: professionList,
                      )
                    : _buildTabletView(
                        context: context,
                        state: state,
                        appTheme: appTheme,
                        size: size,
                      ),
              ],
            )
            // child:
            ),
      ),
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required SignUpScreenState state,
    required IAppThemeData appTheme,
    required Size size,
    required List<ProfessionData> professionList,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 41,
        ),
        _getStartedTitle(appTheme: appTheme),
        Center(
          child: GeneralText(
            Strings.signUpTitle,
            textAlign: TextAlign.center,
            style: appTheme.typographies.interFontFamily.headline4.copyWith(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 27,
        ),
        displayFullName(appTheme),
        const SizedBox(
          height: 27,
        ),
        displayMobileNumber(appTheme),
        const SizedBox(
          height: 27,
        ),
        displayAgeGender(appTheme),
        const SizedBox(
          height: 10,
        ),
        professionList.isNotEmpty
            ? displayProfession(appTheme, professionList)
            : const CircularProgressIndicator(),
        const SizedBox(
          height: 140,
        ),
      ],
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required SignUpScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Container();
  }

  Widget displayFullName(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signFullNameLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline4.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: viewModel.nameController,
            inputType: InputType.text,
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: 'Enter name',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (value) {
              if(viewModel.checkAllInputAdded()){
                viewModel.changeButton(true);
              }else{
                viewModel.changeButton(false);
              }
              // viewModel.onFormValuesChange(
              //     fullName: _nameController.text.trim());
            }),
      ],
    );
  }

  Widget displayMobileNumber(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signMobileNumberLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: viewModel.mobileNumberController,
            inputType: InputType.digit,
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: '923*********',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (newValue) {
              if(viewModel.checkAllInputAdded()){
                viewModel.changeButton(true);
              }else{
                viewModel.changeButton(false);
              }
              // viewModel.onFormValuesChange(
              //     mobileNumber: _mobileNumberController.text.trim());
            }),
      ],
    );
  }

  Widget displayAgeGender(IAppThemeData appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.signAgeLabel,
                textAlign: TextAlign.center,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              GeneralTextInput(
                  height: 80,
                  textFieldWidth: 80,
                  controller: viewModel.ageController,
                  inputType: InputType.digit,
                  backgroundColor: appTheme.colors.textFieldFilledColor,
                  inputBorder: appTheme.focusedBorder,
                  valueStyle: const TextStyle(color: Colors.white),
                  hint: '18',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 14),
                  // valueStyle: valueStyle,
                  onChanged: (newValue) {
                    if (newValue.isNotEmpty) {
                      developer.log(' Age Setup is ' + '${newValue}');
                      viewModel.ageController.text = newValue.toString();
                    }
                    if(viewModel.checkAllInputAdded()){
                      viewModel.changeButton(true);
                    }else{
                      viewModel.changeButton(false);
                    }
                    // viewModel.onFormValuesChange(
                    //     age: int.parse(_ageController.text.trim()));
                  }),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.signGenderLabel,
                textAlign: TextAlign.center,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              _genderWidget(appTheme, Gender.male, Strings.signMaleLabel),
              // Row(
              //   children: [
              //     _genderWidget(appTheme, Gender.male, Strings.signMaleLabel),
              //     const SizedBox(
              //       width: 12,
              //     ),
              //     _genderWidget(
              //         appTheme, Gender.female, Strings.signFemaleLabel),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget displayProfession(
    IAppThemeData appTheme,
    List<ProfessionData> professionList,
  ) {
    loadProfessionList(professionList);
    return viewModel.dropdownItems.isNotEmpty &&
            viewModel.dropdownItems.length > 1
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.signProfessionLabel,
                textAlign: TextAlign.center,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              GeneralDropdown(
                name: 'Select',
                items: viewModel.dropdownItems,
                borderColor: appTheme.colors.textFieldBorderColor,
                // selectedItem: dropdownItems.first,
                style: appTheme.typographies.interFontFamily.headline6.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                onChange: ({
                  required String key,
                  required dynamic value,
                }) {

                  viewModel.professionID = viewModel.dropdownDetails[value];
                },
              )
            ],
          )
        : Container();
  }

  Widget displayAlreadySignIn(
    IAppThemeData appTheme,
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: GeneralText(
              Strings.signAlreadyUserLabel,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: const Color(0xfff7dc99),
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ValueListenableBuilder(
            builder: (context, value, _) {
              return InkWell(
                onTap: value == true? () {
                  //proceedVerification(context);
                  if (viewModel.verifyInput(
                    name: viewModel.nameController.text,
                    mobileNumber: viewModel.mobileNumberController.text,
                    age: int.parse(viewModel.ageController.text),
                    professionId: viewModel.professionID,
                    gender: viewModel.genderController.text,
                    context: context,
                    baseUrl: baseURLs[0],
                  )) {
                    // _showVerificati onPopup(context);
                    // fireBaseAuth();
                    //  VerifyPhoneNumberScreen();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => VerifyPhoneNumberScreen(
                    //             phoneNumber: _mobileNumberController.text,
                    //           )),
                    // );

                    // displayVerificationDisplay(context);
                    displayVerificationDisplayBackup(context);
                    // testPopUp(context);
                  }
                }:null,
                child: ValueListenableBuilder(
                  valueListenable: viewModel.buttonEnabled,
                  builder: (context, value, _){
                    return value == true?
                    SvgPicture.asset(
                      Resources.getSignInRightArrow,
                    )
                        :
                    SvgPicture.asset(
                      Resources.getRightArrow,
                    );
                  },
                ),
              );
            },
            valueListenable: viewModel.buttonEnabled,
          )
        ],
      ),
    );
  }

  Widget fireBaseAuth() {
    developer.log(' Mobile Number is ' + '${viewModel.mobileNumberController.text}');
    return FirebasePhoneAuthHandler(
      phoneNumber: "+" + viewModel.mobileNumberController.text,
      // If true, the user is signed out before the onLoginSuccess callback is fired when the OTP is verified successfully.
      signOutOnSuccessfulVerification: false,

      linkWithExistingUser: false,
      builder: (context, controller) {
        return SizedBox.shrink();
      },
      onLoginSuccess: (userCredential, autoVerified) {
        debugPrint("autoVerified: $autoVerified");
        debugPrint("Login success UID: ${userCredential.user?.uid}");
      },
      onLoginFailed: (authException, stackTrace) {
        debugPrint("An error occurred: ${authException.message}");
      },
      onError: (error, stackTrace) {},
    );
  }

  void proceedVerification(context) {
    viewModel.saveFoodie(
      name: viewModel.nameController.text,
      mobileNumber: viewModel.mobileNumberController.text,
      age: int.parse(viewModel.ageController.text),
      professionId: viewModel.professionID,
      gender: viewModel.genderController.text,
      context: context,
      baseUrl: baseURLs[0],
    );
  }

  Widget _genderWidget(IAppThemeData appTheme, Gender gender, String text) {
    return GeneralGender(
      gender: gender,
      text: text,
      selectedItem: gender,
      items: genderList,
      onTap: (value) {
        viewModel.genderController.text = value;
        if(viewModel.checkAllInputAdded()){
          viewModel.changeButton(true);
        }else{
          viewModel.changeButton(false);
        }
        developer.log(' Here Gender clicked ' + '$value');
      },
    );
    // return Expanded(
    //   child: InkWell(
    //     onTap: () {
    //       changeGender(gender);
    //     },
    //     child: Container(
    //         padding: const EdgeInsets.symmetric(vertical: 15),
    //         child: GeneralText(
    //           text,
    //           textAlign: TextAlign.center,
    //           style: appTheme.typographies.interFontFamily.headline2.copyWith(
    //               color: selectedGender == gender ? Colors.black : Colors.white,
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         decoration: BoxDecoration(
    //             border: Border.all(
    //                 color: appTheme.colors
    //                     .textFieldBorderColor // green as background color
    //
    //                 ),
    //             borderRadius: BorderRadius.circular(10), // radius of 10
    //             color: selectedGender == gender
    //                 ? appTheme.colors.textFieldBorderColor
    //                 : appTheme.colors.primaryBackground)),
    //   ),
    // );
  }

  Widget _getStartedTitle({required IAppThemeData appTheme}) {
    return Center(
      child: GeneralText(
        Strings.letsGetTitle,
        textAlign: TextAlign.center,
        style: appTheme.typographies.interFontFamily.headline4.copyWith(
            color: const Color(0xfff1c452),
            fontSize: 28,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.getStartedButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SignUpScreen()),
        // );
        //    viewModel.goToForgotPasswordScreen();
      },
    );
  }

  // Future<dynamic> _showVerificationPopup(BuildContext context) async {
  //   final appTheme = AppTheme.of(context).theme;
  //   final TextController _otpController = TextController();
  //
  //   return DialogHelper.show(
  //     context: context,
  //     // dialogType: GeneralComponentStyle.success,
  //     isDismissible: true,
  //     barrierLabel: '',
  //
  //     // title: 'Verification\nCode',
  //     body: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           GeneralText(
  //             Strings.verificationPopupTitle,
  //             maxLines: 2,
  //             textAlign: TextAlign.center,
  //             style: appTheme.typographies.interFontFamily.headline6.copyWith(
  //                 color: appTheme.colors.secondaryBackground,
  //                 fontSize: 24,
  //                 fontFamily: 'Poppins-Medium',
  //                 fontWeight: FontWeight.w500),
  //           ),
  //           SizedBox(
  //             height: 14,
  //           ),
  //           GeneralText(
  //             Strings.verificationPopupSubtitle,
  //             textAlign: TextAlign.center,
  //             maxLines: 3,
  //             style: appTheme.typographies.interFontFamily.headline4.copyWith(
  //                 color: appTheme.colors.secondaryBackground,
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //           SizedBox(
  //             height: 34,
  //           ),
  //           Container(
  //             margin: const EdgeInsets.symmetric(horizontal: 12),
  //             child: PinCodeTextField(
  //               controller: _otpController,
  //
  //               length: 4,
  //               cursorColor: appTheme.colors.secondaryBackground,
  //
  //               textStyle: TextStyle(
  //                 color: appTheme.colors.secondaryBackground,
  //               ),
  //               pinTheme: PinTheme(
  //                 shape: PinCodeFieldShape.box,
  //                 selectedColor: Color(0xfff1c452),
  //                 disabledColor: Color(0xfff1c452),
  //                 inactiveColor: Color(0xfff1c452),
  //                 inactiveFillColor: Color(0xff35353C),
  //                 activeColor: Color(0xff35353C),
  //                 borderRadius: BorderRadius.circular(8),
  //                 fieldHeight: 58,
  //                 fieldWidth: 65,
  //                 selectedFillColor: Color(0xff35353C),
  //                 activeFillColor: Color(0xff35353C),
  //               ),
  //               obscureText: false,
  //               keyboardType: TextInputType.number,
  //
  //               enableActiveFill: true,
  //               // validator: (value) {
  //               //   String? validationText =getIt<Localization>().mtLocalized("otp_enterOTP");
  //               //       "Fields cannot be empty";
  //               //   if (value!.length == AppConstants.otpLength) {
  //               //     validationText = null;
  //               //   }
  //               //   return validationText;
  //               // },
  //               animationType: AnimationType.fade,
  //               animationDuration: const Duration(milliseconds: 300),
  //               //errorAnimationController: errorController, // Pass it here
  //               onChanged: (value) {},
  //               onSubmitted: (value) {},
  //               appContext: context,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 50,
  //           ),
  //           GeneralButton.button(
  //             title: Strings.verificationPopupButton.toUpperCase(),
  //             styleType: ButtonStyleType.fill,
  //             width: 170,
  //             onTap: () {
  //               developer.log(
  //                   ' Here Collected data is ' + '${_nameController.text}');
  //               developer.log(
  //                   'Mobile Controller  ' + '${_mobileNumberController.text}');
  //
  //               developer.log(' Age Controller  ' + '${_ageController.text}');
  //               developer.log(' Profession ID   ' + '${_professionID}');
  //
  //               developer
  //                   .log(' Gender selected is    ' + _genderController.text);
  //
  //               if (viewModel.verifyInput(
  //                 name: _nameController.text,
  //                 mobileNumber: _mobileNumberController.text,
  //                 age: int.parse(_ageController.text),
  //                 professionId: _professionID,
  //                 gender: _genderController.text,
  //                 context: context,
  //                 baseUrl: baseURLs[0],
  //               )) {
  //                 viewModel.saveFoodie(
  //                   name: _nameController.text,
  //                   mobileNumber: _mobileNumberController.text,
  //                   age: int.parse(_ageController.text),
  //                   professionId: _professionID,
  //                   gender: _genderController.text,
  //                   context: context,
  //                   baseUrl: baseURLs[0],
  //                 );
  //               }
  //
  //               //  proceedVerification(context);
  //             },
  //           ),
  //           SizedBox(
  //             height: 22,
  //           ),
  //           GeneralText(
  //             Strings.verificationPopupResendCode,
  //             textAlign: TextAlign.center,
  //             style: appTheme.typographies.interFontFamily.headline4.copyWith(
  //                 color: const Color(0xfff7dc99),
  //                 fontSize: 15,
  //                 decoration: TextDecoration.underline,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void showPopUp(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final TextController _otpController = TextController();
    showDialog(
      context: context,
      builder: (context) {
        dcontext = context;
        return AlertDialog(
          //backgroundColor: ,
          title: const Text('Verification'),
          actions: [
            // verificationDesign(context),
          ],
        );
        //    return verificationDesign(context);
      },
    );
    // return AlertDialog(
    //   title: Text(' Alert Dialog'),
    //   content: Text('Do you really want to delete?'),
    //   actions: <Widget>[
    //     TextButton(
    //         onPressed: () {
    //           //action code for "Yes" button
    //         },
    //         child: Text('Yes')),
    //     TextButton(
    //       onPressed: () {
    //         Navigator.pop(context); //close Dialog
    //       },
    //       child: Text('Close One'),
    //     ),
    //     TextButton(
    //       onPressed: () {
    //         Navigator.pop(context); //close Dialog
    //       },
    //       child: Text('Close Tow'),
    //     )
    //   ],
    // );
    // });
  }

  void testPopUp(BuildContext context) {
    showPopUp(context);
    // DialogHelper.show(
    //   context: context,
    //   title: 'Verification code',
    //
    //   body: const Text('Hello Man'),
    //   //   body: CheckListAttachmentsView(
    //   //     checkList: widget._checkList,
    //   //     fieldId: (widget.innerItem?.id)!,
    //   //     itemAttachmentSuccessful: () {
    //   //       setState(() {});
    //   //     },
    //   //   ),
    //   //   isDismissible: false,
    //   //   maxHeight: _screenSizeData.size.height * 0.6,
    //   // );
    //   // }
    //   isDismissible: false,
    //   maxHeight: MediaQuery.of(context).size.height * 0.6,
    // );
  }

  dismissDailog() {
    if (dcontext != null) {
      Navigator.pop(dcontext!);
    }
  }

  void displayVerificationDisplay(BuildContext context) {
    //   void displayAttachmentPopUp() {
    final appTheme = AppTheme.of(context).theme;

    DialogHelper.show(
        dcontext: context,
        // dcontext: context,
        title: 'Verification code',
        isDismissible: true,
        canDismiss: testDisMiss,
        barrierLabel: 'Verification code',
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        //    body: verificationDesign(context),

        context: context);
  }

  bool testDisMiss() {
    developer.log(' Going to dismiss ');
    //  dismissDailog();
    return true;
  }

  void displayVerificationDisplayBackup(BuildContext context) {
    //   void displayAttachmentPopUp() {
    final appTheme = AppTheme.of(context).theme;

    DialogHelper.show(
        // dcontext: context,
        // dcontext: context,
        title: 'Verification code',
        //   body: CheckListAttachmentsView(
        //     checkList: widget._checkList,
        //     fieldId: (widget.innerItem?.id)!,
        //     itemAttachmentSuccessful: () {
        //       setState(() {});
        //     },
        //   ),
        //   isDismissible: false,
        //   maxHeight: _screenSizeData.size.height * 0.6,
        // );
        // }

        isDismissible: true,
        canDismiss: testDisMiss,
        barrierLabel: 'Verification code',
        context: context,
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        body: FirebasePhoneAuthHandler(
          phoneNumber: "+" + viewModel.mobileNumberController.text,
          signOutOnSuccessfulVerification: false,
          linkWithExistingUser: false,
          autoRetrievalTimeOutDuration: const Duration(seconds: 60),
          otpExpirationDuration: const Duration(seconds: 60),
          onCodeSent: () {
            log(VerifyPhoneNumberScreen.id, name: 'OTP sent!');
          },
          onLoginSuccess: (userCredential, autoVerified) async {
            log(
              VerifyPhoneNumberScreen.id,
              name: autoVerified
                  ? 'OTP was fetched automatically!'
                  : 'OTP was verified manually!',
            );

            // showSnackBar('Phone number verified successfully!');
            Toaster.infoToast(
                context: context,
                message: 'Phone number verified successfully!');
            log(
              VerifyPhoneNumberScreen.id,
              name: 'Login Success UID: ${userCredential.user?.uid}',
            );
            viewModel.saveFoodie(
              name: viewModel.nameController.text,
              mobileNumber: viewModel.mobileNumberController.text,
              age: int.parse(viewModel.ageController.text),
              professionId: viewModel.professionID,
              gender: viewModel.genderController.text,
              context: context,
              baseUrl: baseURLs[0],
            );
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   HomeScreen.id,
            //   (route) => false,
            // );
          },
          onLoginFailed: (authException, stackTrace) {
            log(
              VerifyPhoneNumberScreen.id,
              name: (authException.message)!,
              error: authException,
              stackTrace: stackTrace,
            );

            switch (authException.code) {
              case 'invalid-phone-number':
                // invalid phone number
                return Toaster.infoToast(
                    context: context, message: 'Invalid phone number!');
              // developer.log(' Response of Signup is null ' + '$response');
              // return showSnackBar('Invalid phone number!');
              case 'invalid-verification-code':
                // invalid otp entered
                //return TooashowSnackBar('The entered OTP is invalid!');
                return Toaster.infoToast(
                    context: context, message: 'The entered OTP is invalid!');
              // handle other error codes
              default:
                // showSnackBar('Something went wrong!');
                Toaster.infoToast(
                    context: context, message: 'Something went wrong!');
              // handle error further if needed
            }
          },
          onError: (error, stackTrace) {
            log(
              VerifyPhoneNumberScreen.id,
              error: error,
              stackTrace: stackTrace,
            );

            // showSnackBar('An error occurred!');
            Toaster.infoToast(context: context, message: 'An error occurred!');
          },
          builder: (context, controller) {
            //  dcontext = context;
            return verificationDesign(context, controller);
            // return Scaffold(
            //   appBar: AppBar(
            //     leadingWidth: 0,
            //     leading: const SizedBox.shrink(),
            //     title: const Text('Verify Phone Number'),
            //     actions: [
            //       if (controller.codeSent)
            //         TextButton(
            //           onPressed: controller.isOtpExpired
            //               ? () async {
            //                   log(VerifyPhoneNumberScreen.id,
            //                       name: 'Resend OTP');
            //                   await controller.sendOTP();
            //                 }
            //               : null,
            //           child: Text(
            //             controller.isOtpExpired
            //                 ? 'Resend'
            //                 : '${controller.otpExpirationTimeLeft.inSeconds}s',
            //             style:
            //                 const TextStyle(color: Colors.blue, fontSize: 18),
            //           ),
            //         ),
            //       const SizedBox(width: 5),
            //     ],
            //   ),
            //   body: controller.isSendingCode
            //       ? Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: const [
            //             //CustomLoader(),
            //             SizedBox(height: 50),
            //             Center(
            //               child: Text(
            //                 'Sending OTP',
            //                 style: TextStyle(fontSize: 25),
            //               ),
            //             ),
            //           ],
            //         )
            //       : ListView(
            //           padding: const EdgeInsets.all(20),
            //           //  controller: scrollController,
            //           children: [
            //             Text(
            //               "We've sent an SMS with a verification code to ${_mobileNumberController.text}",
            //               style: const TextStyle(fontSize: 25),
            //             ),
            //             const SizedBox(height: 10),
            //             const Divider(),
            //             if (controller.isListeningForOtpAutoRetrieve)
            //               Column(
            //                 children: const [
            //                   //   CustomLoader(),
            //                   SizedBox(height: 50),
            //                   Text(
            //                     'Listening for OTP',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 25,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   ),
            //                   SizedBox(height: 15),
            //                   Divider(),
            //                   Text('OR', textAlign: TextAlign.center),
            //                   Divider(),
            //                 ],
            //               ),
            //             const SizedBox(height: 15),
            //             const Text(
            //               'Enter OTP',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //             const SizedBox(height: 15),
            //             PinInputField(
            //               length: 6,
            //               onFocusChange: (hasFocus) async {
            //                 if (hasFocus) await _scrollToBottomOnKeyboardOpen();
            //               },
            //               onSubmit: (enteredOtp) async {
            //                 final verified =
            //                     await controller.verifyOtp(enteredOtp);
            //                 if (verified) {
            //                   // number verify success
            //                   // will call onLoginSuccess handler
            //                   // viewModel.saveFoodie(name: name, mobileNumber: mobileNumber, age: age, gender: gender, professionId: professionId, context: context, baseUrl: baseUrl)
            //
            //                   viewModel.saveFoodie(
            //                     name: _nameController.text,
            //                     mobileNumber: _mobileNumberController.text,
            //                     age: int.parse(_ageController.text),
            //                     professionId: _professionID,
            //                     gender: _genderController.text,
            //                     context: context,
            //                     baseUrl: baseURLs[0],
            //                   );
            //                   // Navigator.push(
            //                   //   context,
            //                   //   MaterialPageRoute(
            //                   //       builder: (context) => SignUpScreen(
            //                   //         isVerified: true,
            //                   //       )),
            //                   // );
            //                 } else {
            //                   // phone verification failed
            //                   // will call onLoginFailed or onError callbacks with the error
            //                 }
            //               },
            //             ),
            //           ],
            //         ),
            // );
          },
        ));
  }

  Widget verificationDesign(BuildContext context, controller) {
    final appTheme = AppTheme.of(context).theme;
    final TextController _otpController = TextController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GeneralText(
            Strings.verificationPopupTitle,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: appTheme.typographies.interFontFamily.headline6.copyWith(
                color: appTheme.colors.secondaryBackground,
                fontSize: 24,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 14,
          ),
          GeneralText(
            Strings.verificationPopupSubtitle +
                " " +
                viewModel.mobileNumberController.text,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: appTheme.typographies.interFontFamily.headline4.copyWith(
                color: appTheme.colors.secondaryBackground,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 34,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            // child:PinInputField(
            //   length: 6,
            //
            //   onFocusChange: (hasFocus) async {
            //     if (hasFocus) await _scrollToBottomOnKeyboardOpen();
            //   },
            //   onSubmit: (enteredOtp) async {
            //     final verified =
            //     await controller.verifyOtp(enteredOtp);
            //     if (verified) {
            //       // number verify success
            //       // will call onLoginSuccess handler
            //       // viewModel.saveFoodie(name: name, mobileNumber: mobileNumber, age: age, gender: gender, professionId: professionId, context: context, baseUrl: baseUrl)
            //
            //       viewModel.saveFoodie(
            //         name: _nameController.text,
            //         mobileNumber: _mobileNumberController.text,
            //         age: int.parse(_ageController.text),
            //         professionId: _professionID,
            //         gender: _genderController.text,
            //         context: context,
            //         baseUrl: baseURLs[0],
            //       );
            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(
            //       //       builder: (context) => SignUpScreen(
            //       //         isVerified: true,
            //       //       )),
            //       // );
            //     } else {
            //       // phone verification failed
            //       // will call onLoginFailed or onError callbacks with the error
            //     }
            //   },
            // ),

            child: PinCodeTextField(
              controller: _otpController,

              length: 6,
              cursorColor: appTheme.colors.secondaryBackground,

              textStyle: TextStyle(
                color: appTheme.colors.secondaryBackground,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                selectedColor: Color(0xfff1c452),
                disabledColor: Color(0xfff1c452),
                inactiveColor: Color(0xfff1c452),
                inactiveFillColor: Color(0xff35353C),
                activeColor: Color(0xff35353C),
                borderRadius: BorderRadius.circular(8),
                // fieldHeight: 58,
                fieldWidth: 39,
                selectedFillColor: Color(0xff35353C),
                activeFillColor: Color(0xff35353C),
              ),
              obscureText: false,
              keyboardType: TextInputType.number,

              enableActiveFill: true,
              // validator: (value) {
              //   String? validationText =getIt<Localization>().mtLocalized("otp_enterOTP");
              //       "Fields cannot be empty";
              //   if (value!.length == AppConstants.otpLength) {
              //     validationText = null;
              //   }
              //   return validationText;
              // },
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 300),
              //errorAnimationController: errorController, // Pass it here
              onChanged: (value) {},

              onSubmitted: (enteredOtp) async {
                final verified = await controller.verifyOtp(enteredOtp);
                //var verified = false;
                if (verified) {
                  // number verify success
                  // will call onLoginSuccess handler
                  // viewModel.saveFoodie(name: name, mobileNumber: mobileNumber, age: age, gender: gender, professionId: professionId, context: context, baseUrl: baseUrl)

                  viewModel.saveFoodie(
                    name: viewModel.nameController.text,
                    mobileNumber: viewModel.mobileNumberController.text,
                    age: int.parse(viewModel.ageController.text),
                    professionId: viewModel.professionID,
                    gender: viewModel.genderController.text,
                    context: context,
                    baseUrl: baseURLs[0],
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SignUpScreen(
                  //         isVerified: true,
                  //       )),
                  // );
                } else {
                  // phone verification failed
                  // will call onLoginFailed or onError callbacks with the error
                }
              },
              appContext: context,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GeneralButton.button(
            title: Strings.verificationPopupButton.toUpperCase(),
            styleType: ButtonStyleType.fill,
            width: 170,
            onTap: () {
              developer
                  .log(' Here Collected data is ' + '${viewModel.nameController.text}');
              developer.log(
                  'Mobile Controller  ' + '${viewModel.mobileNumberController.text}');

              developer.log(' Age Controller  ' + '${viewModel.ageController.text}');
              developer.log(' Profession ID   ' + '${viewModel.professionID}');

              developer.log(' Gender selected is    ' + viewModel.genderController.text);

              if (viewModel.verifyInput(
                name: viewModel.nameController.text,
                mobileNumber: viewModel.mobileNumberController.text,
                age: int.parse(viewModel.ageController.text),
                professionId: viewModel.professionID,
                gender: viewModel.genderController.text,
                context: context,
                baseUrl: baseURLs[0],
              )) {
                viewModel.saveFoodie(
                  name: viewModel.nameController.text,
                  mobileNumber: viewModel.mobileNumberController.text,
                  age: int.parse(viewModel.ageController.text),
                  professionId: viewModel.professionID,
                  gender: viewModel.genderController.text,
                  context: context,
                  baseUrl: baseURLs[0],
                );
              }

              //  proceedVerification(context);
            },
          ),
          SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              displayVerificationDisplayBackup(context);
              Toaster.infoToast(
                  context: context, message: 'Verification Code Resent');
            },
            child: GeneralText(

              Strings.verificationPopupResendCode,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: const Color(0xfff7dc99),
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }
}
