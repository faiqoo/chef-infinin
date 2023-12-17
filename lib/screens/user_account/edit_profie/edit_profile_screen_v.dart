import 'dart:ui';

import 'package:chef/helpers/color_helper.dart';
import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/bottom_bar/bottom_bar.dart' as bb;
import 'package:chef/screens/screen.dart';
import 'package:chef/screens/user_account/reviews.dart';
import 'package:chef/screens/user_account/user_profile.dart';
import 'package:flutter/material.dart';

import '../../../constants/resources.dart';
import '../../../constants/strings.dart';
import '../../../theme/app_theme_data/app_theme_data.dart';
import '../../../theme/app_theme_widget.dart';
import '../../../ui_kit/widgets/general_new_appbar.dart';
import '../../../ui_kit/widgets/general_text.dart';

import 'dart:developer' as developer;

import 'edit_profile_screen_vm.dart';

class EditProfileScreen extends BaseView<EditProfileScreenViewModel> {
  EditProfileScreen({Key? key}) : super(key: key);
  List<String> accountList = [
    Strings.labelPersonalDetails,
    Strings.labelProfile,
    Strings.labelReviews
  ];

  List<String> othersList = [
    Strings.labelPrivacyPolicy,
    Strings.labelTermsCond,
    Strings.labelLogOut,
  ];

  Future<bool> onWillPop() async {
    return false;
  }

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;
    return WillPopScope(
        onWillPop: () => onWillPop(),
        child:SafeArea(
      child: Scaffold(
        backgroundColor: HexColor.fromHex("#212129"),
        body: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
              child:const GeneralNewAppBar(
              //   callBack:(context)=> Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const bb.BottomBar()),
              // ),
                rightIcon: Resources.homeIconSvg,
                title: Strings.labelProfile,
                titleColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            _Header(
              appTheme: appTheme,
              title: Strings.labelHeaderAccount,
            ),
            ListView.separated(
              itemCount: accountList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: InkWell(
                    onTap: () {
                      if (accountList.elementAt(index) == Strings.labelPersonalDetails) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile()),
                        );
                      } else if (accountList.elementAt(index) == Strings.labelProfile) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpQuestionireScreen()),
                        );
                      } else if (accountList.elementAt(index) == Strings.labelReviews) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReviewsScreen()),
                        );
                      }

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralText(
                          accountList.elementAt(index),
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                        ),
                        SvgPicture.asset(Resources.arrowProfileSVG),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xfff1c452).withOpacity(0.3),
                );
              },
            ),
            _Header(
              appTheme: appTheme,
              title: Strings.labelHeaderOthers,
            ),
            ListView.separated(
              itemCount: othersList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (othersList.elementAt(index) == Strings.labelLogOut) {
                        developer.log(' Clicked on logout ');
                        viewModel.logout(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GeneralText(
                            othersList.elementAt(index),
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                          ),
                          SvgPicture.asset(Resources.arrowProfileSVG),
                        ],
                      ),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xfff1c452).withOpacity(0.3),
                );
              },
            ),
          ]),
        ),
      ),
    ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.appTheme,
    required this.title,
  }) : super(key: key);

  final IAppThemeData appTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 23),
      color: HexColor.fromHex("#2c292b"),
      child: Row(
        children: [
          GeneralText(
            title,
            style: appTheme.typographies.interFontFamily.headline6.copyWith(
                fontSize: 20,
                color: HexColor.fromHex('#f1c452'),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
