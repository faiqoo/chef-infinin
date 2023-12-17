import 'dart:ui';

import 'package:chef/helpers/color_helper.dart';
import 'package:flutter/material.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../food_product_experience_details/food_product_details_screen_v.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<SocialMediaHandles> handlesList = [];

  @override
  void initState() {
    // TODO: implement initState

    handlesList.addAll([
      SocialMediaHandles(
          socialMediaName: Strings.userProfileSocialMediaHandle,
          socialMediaIcon: "assets/images/icons/instagram_1.png"),
      SocialMediaHandles(
          socialMediaName: Strings.userProfileSocialMediaHandle,
          socialMediaIcon: "assets/images/icons/facebook.png"),
      SocialMediaHandles(
          socialMediaName: Strings.userProfileSocialMediaHandle,
          socialMediaIcon: "assets/images/icons/twitter.png"),
      SocialMediaHandles(
          socialMediaName: Strings.userProfileSocialMediaHandle,
          socialMediaIcon: "assets/images/icons/tiktok.png")
    ]);
    super.initState();
  }

  Future<bool> onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double _sigmaX = 8; // from 0-10
    double _sigmaY = 8; // from 0-10
    double _opacity = 1;
    final appTheme = AppTheme.of(context).theme;
    return WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Container(
                    // decoration: BoxDecoration(
                    //   color: HexColor.fromHex("#212129").withOpacity(0.8),
                    // ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/icons/user_blurred.jpeg'),
                            fit: BoxFit.cover)),
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        color: HexColor.fromHex("#212129").withOpacity(0.96),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: GeneralNewAppBar(
                                rightIcon: Resources.homeIconSvg,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 129,
                              child: Image.asset(
                                  'assets/images/icons/userProfile.png',
                                  fit: BoxFit.fill),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           FoodProductExperienceDetails()),
                                // );
                              },
                              child: GeneralText(
                                Strings.userProfileName,
                                style: appTheme
                                    .typographies.interFontFamily.headline6
                                    .copyWith(
                                        fontSize: 25,
                                        color: HexColor.fromHex('#f1c452'),
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18.9,
                                  child: Image.asset(
                                      'assets/images/icons/star.png',
                                      fit: BoxFit.fill),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GeneralText(
                                  Strings.userProfileReviews,
                                  style: appTheme
                                      .typographies.interFontFamily.headline6
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          fontSize: 12,
                                          color: HexColor.fromHex('#8ea659')),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 23),
                  color: HexColor.fromHex("#2c292b"),
                  child: Row(
                    children: [
                      GeneralText(
                        Strings.userProfileDetailsLabel,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                fontSize: 20,
                                color: HexColor.fromHex('#f1c452'),
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    color: HexColor.fromHex("#212129"),
                    padding:
                        EdgeInsetsDirectional.only(start: 23, end: 23, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        firstQuestioner(appTheme),
                        const SizedBox(
                          height: 38,
                        ),
                        secondQuestioner(appTheme),
                        const SizedBox(
                          height: 38,
                        ),
                        userInterest(appTheme),
                        const SizedBox(
                          height: 38,
                        ),
                        socialMediaHandles(appTheme),
                      ],
                    )),
              ]),
            ),
          ),
        ));
  }

  Widget firstQuestioner(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.userProfileFirstQuestioner,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 16,
              color: HexColor.fromHex('#fee4a4'),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        GeneralText(
          Strings.userProfileFirstQuestionerAnswer,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 15,
              color: HexColor.fromHex('#909094'),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget secondQuestioner(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.userProfileSecondQuestioner,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 16,
              color: HexColor.fromHex('#fee4a4'),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        GeneralText(
          Strings.userProfileSecondQuestionerAnswer,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 15,
              color: HexColor.fromHex('#909094'),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget userInterest(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.userProfileYourInterestLabel,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 18,
              color: HexColor.fromHex('#fee4a4'),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 58,
                  padding: const EdgeInsetsDirectional.all(10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/icons/food_item_circle.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/icons/food_item_sample.png',
                  ),
                ),
                GeneralText(
                  Strings.userProfileSportsLabel,
                  style:
                      appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 14,
                    color: HexColor.fromHex('#ffffff'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Container(
                  width: 58,
                  padding: const EdgeInsetsDirectional.all(10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/icons/food_item_circle.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/icons/food_item_sample.png',
                  ),
                ),
                GeneralText(
                  Strings.userProfileTravellingLabel,
                  style:
                      appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 14,
                    color: HexColor.fromHex('#ffffff'),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget socialMediaHandles(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.userProfileSocialMediaLabel,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 18,
              color: HexColor.fromHex('#fee4a4'),
              fontWeight: FontWeight.w400),
        ),
        GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 20,
              childAspectRatio: 2,
            ),
            itemCount: handlesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    width: 38,
                    padding: const EdgeInsetsDirectional.all(6),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#4b4b52"),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      handlesList[index].socialMediaIcon ?? "",
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: GeneralText(
                      handlesList[index].socialMediaName ?? "",
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 14,
                        color: HexColor.fromHex('#ffffff'),
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}

class SocialMediaHandles {
  String? socialMediaName;
  String? socialMediaIcon;

  SocialMediaHandles({this.socialMediaIcon, this.socialMediaName});
}
