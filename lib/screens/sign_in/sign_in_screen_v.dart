import 'package:chef/screens/sign_in/sign_in_screen_vm.dart';
import 'package:chef/services/device/device_service.dart';
import 'package:chef/ui_kit/widgets/general_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../base/base_view.dart';
import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/general_ui_kit.dart';
import '../../ui_kit/helpers/dialog_helper.dart';
import '../../ui_kit/widgets/general_bottom_sheet.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../sign_up/sign_up_screen_v.dart';

class SignInScreen extends BaseView<SignInScreenViewModel> {
  SignInScreen({Key? key}) : super(key: key);
  final TextController _mobileNumberController = TextController();

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 142,
              left: 187,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/icons/food_product_ring.png',
                  height: 300,
                  color: const Color(0xfff1c452).withOpacity(0.1),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 41,
                  ),
                  Center(
                    child: GeneralText(
                      Strings.signInLabel,
                      textAlign: TextAlign.center,
                      style: appTheme.typographies.interFontFamily.headline4
                          .copyWith(
                              color: Color(0xfff1c452),
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 127,
                  ),
                  GeneralText(
                    Strings.signInMobileNumberLabel,
                    textAlign: TextAlign.center,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: const Color(0xfffbeccb),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GeneralTextInput(
                      controller: _mobileNumberController,
                      inputType: InputType.digit,
                      backgroundColor: appTheme.colors.textFieldFilledColor,
                      valueStyle: const TextStyle(color: Colors.white),
                      inputBorder: appTheme.focusedBorder,
                      hint: '+92 345 000 0000',
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      onChanged: (newValue) {}),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: SvgPicture.asset(
                            Resources.getSignInLeftArrow,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.verifyUser(
                              mobileNumber: _mobileNumberController.text
                                  .toString()
                                  .trim(),
                              context: context,
                            );
                          },
                          child: SvgPicture.asset(
                            Resources.getSignInRightArrow,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
  //             margin: EdgeInsets.symmetric(horizontal: 12),
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
  //           SizedBox(
  //             height: 50,
  //           ),
  //           GeneralButton.button(
  //             title: Strings.verificationPopupButton.toUpperCase(),
  //             styleType: ButtonStyleType.fill,
  //             width: 170,
  //             onTap: () {
  //               viewModel.verifyUser(
  //                 mobileNumber: _mobileNumberController.text.toString().trim(),
  //                 context: context,
  //               );
  //               // Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute(builder: (context) => SignUpScreen()),
  //               // );
  //               //    viewModel.goToForgotPasswordScreen();
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
  //     // body: GBottomSheet<String>(
  //     //   bottomSheetTitle: Strings.chooseDateFormat,
  //     //   list: ['7878,87,876'],
  //     //   selectedItem: viewModel.getSelectedFormat(),
  //     //   bottomSheetType: BottomSheetType.dateFormat,
  //     // ),
  //   );
  // }
}
