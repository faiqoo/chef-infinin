import 'dart:ui';

import 'package:chef/helpers/color_helper.dart';
import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/user_account/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/helpers/dialog_helper.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../food_product_experience_details/food_product_details_screen_v.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final TextController _reviewController = TextController();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor.fromHex("#212129"),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
              child: const GeneralNewAppBar(
                rightIcon: Resources.homeIconSvg,
                title: Strings.labelTitleReviews,
                titleColor: Colors.white,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _showRatingPopup(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralText(
                            '11-04-2022',
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.4),
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage(Resources.seafoodPNG)),
                              SizedBox(
                                width: 17,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        GeneralText(
                                          'BBQ Experience',
                                          style: appTheme.typographies
                                              .interFontFamily.headline6
                                              .copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10), // radius of 10
                                            color: const Color(0xfff1c452),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 3),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.red,
                                                size: 12,
                                              ),
                                              GeneralText(
                                                '4.6',
                                                style: appTheme.typographies
                                                    .interFontFamily.headline6
                                                    .copyWith(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    GeneralText(
                                      'Zee Lounge',
                                      style: appTheme.typographies
                                          .interFontFamily.headline6
                                          .copyWith(
                                              fontSize: 12,
                                              color: const Color(0xfff1c452),
                                              fontWeight: FontWeight.w400),
                                    ),
                                    GeneralText(
                                      Strings.letsStartScreenLabel1,
                                      maxLines: 3,
                                      style: appTheme.typographies
                                          .interFontFamily.headline6
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Color(0xfff1c452),
                    indent: 20,
                    thickness: 0.1,
                    endIndent: 20,
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<dynamic> _showRatingPopup(BuildContext context) async {
    final appTheme = AppTheme.of(context).theme;

    return DialogHelper.show(
      context: context,
      // dialogType: GeneralComponentStyle.success,
      isDismissible: true,
      barrierLabel: '',
      // title: 'Verification\nCode',
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(Resources.reviewCheckPNG,height: 63,),
            SizedBox(
              height: 16,
            ),
            GeneralText(
              Strings.ratingPopupTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: Color(0xff8ea659),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 19,
            ),
            GeneralText(
              Strings.ratingPopupSubTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 21,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Color(0xfff1c452),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: 28,
            ),
            GeneralTextInput(
                controller: _reviewController,
                inputType: InputType.text,
                isMultiline: true,
                backgroundColor: appTheme.colors.textFieldFilledColor,
                inputBorder: appTheme.focusedBorder,
                valueStyle: const TextStyle(color: Colors.white),
                hint: 'Write Something',
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4), fontSize: 14),
                // valueStyle: valueStyle,
                onChanged: (newValue) {}),
            SizedBox(
              height: 22,
            ),
            GeneralButton.button(
              title: Strings.ratingPopupBtnTitle.toUpperCase(),
              styleType: ButtonStyleType.fill,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUpScreen()),
                // );
                //    viewModel.goToForgotPasswordScreen();
              },
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
      // body: GBottomSheet<String>(
      //   bottomSheetTitle: Strings.chooseDateFormat,
      //   list: ['7878,87,876'],
      //   selectedItem: viewModel.getSelectedFormat(),
      //   bottomSheetType: BottomSheetType.dateFormat,
      // ),
    );
  }
}
