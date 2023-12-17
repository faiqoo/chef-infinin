import 'dart:ui';

import 'package:chef/helpers/helpers.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../models/booking/advance_pending_response.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/helpers/dialog_helper.dart';
import '../../ui_kit/widgets/general_button.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../booking/food_item_booking.dart';
import '../custom_form/widgets/exto_field_option.dart';

import 'package:qr_flutter/qr_flutter.dart';

class FoodProductBookingConfirmedDetails extends StatefulWidget {
  // const FoodProductBookingConfirmedDetails({Key? key}) : super(key: key);

  const FoodProductBookingConfirmedDetails(
      {Key? key, required AdvancePendingResponse advancePendingDetails})
      : _advancePendingDetails = advancePendingDetails,
        super(key: key);

  final AdvancePendingResponse _advancePendingDetails;

  @override
  State<FoodProductBookingConfirmedDetails> createState() =>
      _FoodProductBookingConfirmedDetailsState();
}

class _FoodProductBookingConfirmedDetailsState
    extends State<FoodProductBookingConfirmedDetails> {
  List<CustomModel> wowFactorsList = [];
  List<CustomModel> menuListItems = [];
  bool checkValue = false;
  bool qr_code_scanned = false;
  bool showDetailsView = false;
  dynamic group1Value;
  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5;

  @override
  void initState() {
    // TODO: implement initState
    menuListItems.addAll([
      CustomModel(name: "Sindhi Biryani"),
      CustomModel(name: "Buritto"),
      CustomModel(name: "Vegetable Salad"),
      CustomModel(name: "Hyderabadi Rice"),
      CustomModel(name: "Soft Drinks"),
    ]);
    wowFactorsList.addAll([
      CustomModel(
          name: Strings.productDetailWowFactorGarden,
          icon: "assets/images/icons/garden.png"),
      CustomModel(
          name: Strings.productDetailWowFactorFireworks,
          icon: "assets/images/icons/fireworks.png"),
      CustomModel(
          name: Strings.productDetailWowFactorPetFriendly,
          icon: "assets/images/icons/pet_friendly.png"),
      CustomModel(
          name: Strings.productDetailWowFactorWifi,
          icon: "assets/images/icons/wifi_2.png"),
      CustomModel(
          name: Strings.productDetailWowFactorMusic,
          icon: "assets/images/icons/music.png"),
      CustomModel(
          name: Strings.productDetailWowFactorParking,
          icon: "assets/images/icons/parking.png")
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: getStartedButtonTitle(appTheme: appTheme),
      body: Container(
          color: HexColor.fromHex("#212129"),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 217,
                padding: EdgeInsets.only(bottom: 17),
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#4b4b52"),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -40,
                      top: -20,
                      child: Container(
                        width: 200,
                        padding: const EdgeInsetsDirectional.all(20),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/icons/food_product_ring.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/icons/food_product_experience.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GeneralText(
                              // Strings.productDetailTitle,
                              widget._advancePendingDetails.t.experienceName,
                              style: appTheme
                                  .typographies.interFontFamily.headline6
                                  .copyWith(
                                fontSize: 22,
                                color: HexColor.fromHex('#f1c452'),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            GeneralText(
                              // Strings.productDetailSubTitle,
                              widget._advancePendingDetails.t.brandName,
                              style: appTheme
                                  .typographies.interFontFamily.headline6
                                  .copyWith(
                                fontSize: 14,
                                color: HexColor.fromHex('#909094'),
                              ),
                            ),
                            const SizedBox(
                              height: 5.8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 13.9,
                                  child: Image.asset(
                                      'assets/images/icons/star.png',
                                      fit: BoxFit.fill),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GeneralText(
                                  Strings.productDetailReview,
                                  style: appTheme
                                      .typographies.interFontFamily.headline6
                                      .copyWith(
                                          fontSize: 12,
                                          color: HexColor.fromHex('#8ea659')),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Positioned.fill(
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(
                              start: 19.5, end: 19.5, top: 7, bottom: 7),
                          decoration: BoxDecoration(
                              color: HexColor.fromHex("#b0c18b"),
                              borderRadius: BorderRadius.circular(20)),
                          child: GeneralText(
                            Strings.foodItemBookingConfirmedStatus
                                .toUpperCase(),
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                              fontSize: 12,
                              color: HexColor.fromHex('#212129'),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 40,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 29),
                            child: GeneralNewAppBar(
                              rightIcon: Resources.homeIconSvg,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GeneralText(
                        Strings.foodItemBookingConfirmedOrderNo +
                                widget._advancePendingDetails.t.verificationCode
                                    .toString() ??
                            '',
                        style: appTheme.typographies.interFontFamily.headline2
                            .copyWith(
                          fontSize: 17,
                          color: HexColor.fromHex('#f1c452'),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (qr_code_scanned) {
                                qr_code_scanned = false;
                              } else {
                                qr_code_scanned = true;
                              }
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: qr_code_scanned
                                        ? Border.all(
                                            color: HexColor.fromHex("#8ea659"),
                                            width: 10)
                                        : Border.all(
                                            color: Colors.white, width: 10),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                          width: 181,
                                          height: 185,
                                          child: QrImage(
                                            data: widget._advancePendingDetails
                                                .t.qrRequest!
                                                .toJson()
                                                .toString(),
                                          ))

                                      // Image.asset(
                                      //   "assets/images/icons/qr_code_sample.jpeg",
                                      //
                                      // ),

                                      // Positioned.fill(
                                      //     top: 10,
                                      //     right: 20,
                                      //     child: Container(
                                      //         width: 24,
                                      //         height: 24,
                                      //         decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: HexColor.fromHex("#8ea659"),
                                      //         ),
                                      //         child: Icon(
                                      //           Icons.check,
                                      //           color: Colors.white,
                                      //           size: 23,
                                      //         ))),
                                    ],
                                  )),
                              if (qr_code_scanned)
                                Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        Resources.bookingCheckboxPNG,
                                        height: 24,
                                      )),
                                ),
                            ],
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      GeneralText(
                        Strings.foodItemBookingConfirmedComment,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                          fontSize: 16,
                          color: HexColor.fromHex('#ffffff'),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      chefInformation(appTheme),
                      const SizedBox(
                        height: 33.9,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 25, end: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GeneralText(
                              Strings.bookingConfirmedDetailsLabel,
                              style: appTheme
                                  .typographies.interFontFamily.headline2
                                  .copyWith(
                                fontSize: 20,
                                color: HexColor.fromHex('#f1c452'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (showDetailsView) {
                                    showDetailsView = false;
                                  } else {
                                    showDetailsView = true;
                                  }
                                });
                              },
                              child: showDetailsView
                                  ? Container(
                                      width: 26,
                                      child: Image.asset(
                                        "assets/images/icons/showData.png",
                                      ),
                                    )
                                  : Container(
                                      width: 26,
                                      child: Image.asset(
                                        "assets/images/icons/hideData.png",
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32.3,
                      ),
                      showDetails(appTheme),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget wowFactors(IAppThemeData appTheme) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Wrap(
        children: [
          for (int i = 0; i < wowFactorsList.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 17, bottom: 7.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 58,
                    height: 52,
                    padding: const EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/icons/food_item_circle.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                        color: HexColor.fromHex("#f1c452"),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(wowFactorsList[i].icon != null
                          ? wowFactorsList[i].icon ?? ""
                          : ''),
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  GeneralText(
                    wowFactorsList[i].name ?? "",
                    style: appTheme.typographies.interFontFamily.headline6
                        .copyWith(
                      fontSize: 14,
                      color: HexColor.fromHex('#ffffff'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
          top: 20, bottom: 20, start: 11.8, end: 11.8),
      decoration: BoxDecoration(
          color: HexColor.fromHex("#4b4b52"),
          borderRadius: BorderRadius.circular(15)),
      child: Wrap(
        children: [
          for (int i = 0; i < wowFactorsList.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 17, bottom: 7.7),
              child: Column(
                children: [
                  Container(
                    width: 58,
                    padding: const EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/icons/food_item_circle.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                        color: HexColor.fromHex("#f1c452"),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(wowFactorsList[i].icon != null
                          ? wowFactorsList[i].icon ?? ""
                          : ''),
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  GeneralText(
                    wowFactorsList[i].name ?? "",
                    style: appTheme.typographies.interFontFamily.headline6
                        .copyWith(
                      fontSize: 14,
                      color: HexColor.fromHex('#ffffff'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget foodProductDetails(IAppThemeData appTheme) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 25, end: 25),
      child: Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.only(
              top: 22, bottom: 29, start: 10, end: 10),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#4b4b52"),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 17, bottom: 17, start: 26, end: 48),
                decoration: BoxDecoration(
                    color: HexColor.fromHex("#212129"),
                    borderRadius: BorderRadius.circular(11)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GeneralText(
                            Strings.productDetailSelectionDate,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#ea7458'),
                            ),
                          ),
                          GeneralText(
                            Strings.productDetailSelectionTime,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 30,
                              color: HexColor.fromHex('#b0c18b'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: HexColor.fromHex('#707070'),
                        width: 1,
                        height: 69,
                      ),
                      Column(
                        children: [
                          GeneralText(
                            Strings.productDetailSelectionType,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#8ea659'),
                            ),
                          ),
                          GeneralText(
                            Strings.productDetailSelectionTotalPersons,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 30,
                              color: HexColor.fromHex('#8ea659'),
                            ),
                          ),
                          GeneralText(
                            Strings.productDetailSelectionPersons,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    fontSize: 12,
                                    color: HexColor.fromHex('#909094'),
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 29,
              ),
              productRelatedNotes(appTheme),
              SizedBox(
                height: 29,
              ),
              productMenuDetails(appTheme),
            ],
          )),
    );
  }

  Widget productRelatedNotes(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.productDetailSelectionNotesLabel,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
            fontSize: 16,
            color: HexColor.fromHex('#f1c452'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.only(
              top: 15, bottom: 15, start: 14, end: 14),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#212129"),
              borderRadius: BorderRadius.circular(11)),
          child: GeneralText(
            Strings.productDetailSelectionNotes,
            style: appTheme.typographies.interFontFamily.headline6.copyWith(
                fontSize: 14,
                color: HexColor.fromHex('#ffffff'),
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget productMenuDetails(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.productDetailSelectionMenuLabel,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
            fontSize: 16,
            color: HexColor.fromHex('#f1c452'),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Wrap(
          children: [
            for (int index = 0; index < menuListItems.length; index++)
              Container(
                width: 140,
                // height: 67,
                padding: const EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 14, end: 14),
                margin: EdgeInsets.only(right: 5, bottom: 7),
                decoration: BoxDecoration(
                    color: HexColor.fromHex("#212129"),
                    borderRadius: BorderRadius.circular(11)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralText(
                          Strings.productDetailSelectionMenuQuantity,
                          style: appTheme.typographies.interFontFamily.headline2
                              .copyWith(
                            fontSize: 16,
                            color: HexColor.fromHex('#f89f84'),
                          ),
                        ),
                        GeneralText(
                          Strings.productDetailSelectionMenuAmount,
                          style: appTheme.typographies.interFontFamily.headline2
                              .copyWith(
                            fontSize: 16,
                            color: HexColor.fromHex('#909094'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GeneralText(
                      menuListItems[index].name ?? "",
                      style: appTheme.typographies.interFontFamily.headline2
                          .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#ffffff'),
                              fontWeight: FontWeight.w400),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
          ],
        ),
        /*GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              mainAxisSpacing: 7,
              crossAxisSpacing: 5,
              // mainAxisExtent: 67,
            ),
            itemCount: menuListItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 14, end: 14),
                decoration: BoxDecoration(
                    color: HexColor.fromHex("#212129"),
                    borderRadius: BorderRadius.circular(11)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralText(
                          Strings.productDetailSelectionMenuQuantity,
                          style: appTheme.typographies.interFontFamily.headline2
                              .copyWith(
                            fontSize: 16,
                            color: HexColor.fromHex('#f89f84'),
                          ),
                        ),
                        GeneralText(
                          Strings.productDetailSelectionMenuAmount,
                          style: appTheme.typographies.interFontFamily.headline2
                              .copyWith(
                            fontSize: 16,
                            color: HexColor.fromHex('#909094'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: GeneralText(
                        menuListItems[index].name ?? "",
                        style: appTheme.typographies.interFontFamily.headline2
                            .copyWith(
                                fontSize: 14,
                                color: HexColor.fromHex('#ffffff'),
                                fontWeight: FontWeight.w400),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              );
            }),*/
      ],
    );
  }

  Widget chefInformation(IAppThemeData appTheme) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 25, end: 25),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: HexColor.fromHex('#f1c452'),
                width: 16,
                height: 1,
              ),
              const SizedBox(
                width: 7.2,
              ),
              GeneralText(
                Strings.productDetailChefLabel,
                style: appTheme.typographies.interFontFamily.headline6.copyWith(
                  fontSize: 20,
                  color: HexColor.fromHex('#f1c452'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.1,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
                top: 22, bottom: 22, start: 23, end: 23),
            decoration: BoxDecoration(
                color: HexColor.fromHex("#4b4b52"),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle),
                      child: Image.asset("assets/images/icons/user_image.png")),
                  SizedBox(
                    width: 11.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralText(
                        // Strings.productDetailChefName,
                        widget._advancePendingDetails.t.brandName,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                          fontSize: 18,
                          color: HexColor.fromHex('#f1c452'),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 10.8,
                              child: Image.asset(
                                  "assets/images/icons/location_pin.png")),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              width: 150,
                              child: GeneralText(
                                // Strings.productDetailChefLocation,
                                widget._advancePendingDetails.t.address,
                                maxLines: 2,
                                style: appTheme
                                    .typographies.interFontFamily.headline6
                                    .copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                              )),
                        ],
                      )
                    ],
                  )
                ]),
                SizedBox(
                  height: 18.1,
                ),
                Container(
                  color: HexColor.fromHex("#ffffff").withOpacity(0.3),
                  width: double.infinity,
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                GeneralText(
                  Strings.productDetailChefSubHost,
                  style:
                      appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 14,
                    color: HexColor.fromHex('#909094'),
                  ),
                ),
                GeneralText(
                  // Strings.productDetailChefSubHostName,
                  widget._advancePendingDetails.t.subHost,
                  //+
                  //     widget._advancePendingDetails.t.subHostMobileNo,
                  style:
                      appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 18,
                    color: HexColor.fromHex('#f1c452'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget productPriceInformation(IAppThemeData appTheme) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 25, end: 25),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: HexColor.fromHex('#f1c452'),
                width: 16,
                height: 1,
              ),
              const SizedBox(
                width: 7.5,
              ),
              GeneralText(
                Strings.productDetailPriceLabel,
                style: appTheme.typographies.interFontFamily.headline6.copyWith(
                  fontSize: 20,
                  color: HexColor.fromHex('#f1c452'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.1,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
                top: 22, bottom: 22, start: 23, end: 23),
            decoration: BoxDecoration(
                color: HexColor.fromHex("#4b4b52"),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GeneralText(
                        Strings.productDetailPriceValue,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                fontSize: 36,
                                color: HexColor.fromHex('#f89f84'),
                                fontWeight: FontWeight.w300),
                      ),
                      GeneralText(
                        Strings.productDetailPriceTotal,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                          fontSize: 15,
                          color: HexColor.fromHex('#ffffff'),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 18.1,
                ),
                Container(
                  color: HexColor.fromHex("#ffffff").withOpacity(0.3),
                  width: double.infinity,
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralText(
                      Strings.productDetailPriceTax,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                    GeneralText(
                      Strings.productDetailPriceTaxValue,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GeneralText(
                          Strings.productDetailAdvancePayment,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                            fontSize: 15,
                            color: HexColor.fromHex('#8ea659'),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          // padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor.fromHex('#8ea659'),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    GeneralText(
                      Strings.foodItemAdvancePaymentValue,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        color: HexColor.fromHex('#8ea659'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.foodItemBookingConfirmedCancelOrderButton.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        showGeneralPopup(context);
      },
    );
    // ExtoText(
    //   Strings.getStartedButtonTitle,
    //   style: appTheme.typographies.interFontFamily.headline2,
    // );
  }

  Widget showDetails(IAppThemeData appTheme) {
    return showDetailsView
        ? Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 25, end: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: HexColor.fromHex('#f1c452'),
                          width: 16,
                          height: 1,
                        ),
                        const SizedBox(
                          width: 7.2,
                        ),
                        GeneralText(
                          Strings.productDetailAboutTitle,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                            fontSize: 20,
                            color: HexColor.fromHex('#f1c452'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: GeneralText(
                        Strings.productDetailAboutSubTitle,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                fontSize: 14,
                                color: HexColor.fromHex('#ffffff'),
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      children: [
                        Container(
                          color: HexColor.fromHex('#f1c452'),
                          width: 16,
                          height: 1,
                        ),
                        const SizedBox(
                          width: 7.2,
                        ),
                        GeneralText(
                          Strings.productDetailWowFactorTitle,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                            fontSize: 20,
                            color: HexColor.fromHex('#f1c452'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11.6,
                    ),
                    wowFactors(appTheme),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              foodProductDetails(appTheme),
              const SizedBox(
                height: 28,
              ),
              productPriceInformation(appTheme),
              SizedBox(
                height: 209,
              ),
            ],
          )
        : Container();
  }

  List<ExtoFieldOption> listOfRadio = [
    ExtoFieldOption(
        optionData: FieldOptionModel(
            id: "1",
            label: "Lorem ipsum dolor sit amet, consectetur",
            value: "1")),
    ExtoFieldOption(
        optionData: FieldOptionModel(
            id: "2",
            label: "Lorem ipsum dolor sit amet, consectetur",
            value: "2")),
    ExtoFieldOption(
        optionData: FieldOptionModel(
            id: "3",
            label: "Lorem ipsum dolor sit amet, consectetur",
            value: "3")),
    ExtoFieldOption(
        optionData: FieldOptionModel(
            id: "4",
            label: "Lorem ipsum dolor sit amet, consectetur",
            value: "4")),
  ];

  showGeneralPopup(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return DialogHelper.showBottomSheetDialog(
      borderRadius: 20,
      context: context,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: 25,
            end: 28,
            top: 41,
          ),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#212129"),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            children: [
              GeneralText(
                Strings.bottomSheetTellUsWhyTitle,
                maxLines: 2,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 17,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(children: [
                  Row(
                    children: [
                      Radio(
                        visualDensity: VisualDensity.compact,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return HexColor.fromHex("#fbeccb");
                        }),
                        activeColor: HexColor.fromHex("#fbeccb"),
                        value: 0,
                        groupValue: group1Value,
                        onChanged: (value) {
                          setState(() {
                            group1Value = value;
                          });
                        },
                      ),
                      Expanded(
                        child: GeneralText(
                          Strings.bottomSheetTellUsWhyRadioHint,
                          maxLines: 2,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  color: HexColor.fromHex("#fbeccb"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        visualDensity: VisualDensity.compact,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return HexColor.fromHex("#fbeccb");
                        }),
                        activeColor: HexColor.fromHex("#fbeccb"),
                        value: 1,
                        groupValue: group1Value,
                        onChanged: (value) {
                          setState(() {
                            group1Value = value;
                          });
                        },
                      ),
                      Expanded(
                        child: GeneralText(
                          Strings.bottomSheetTellUsWhyRadioHint,
                          maxLines: 2,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  color: HexColor.fromHex("#fbeccb"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        visualDensity: VisualDensity.compact,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return HexColor.fromHex("#fbeccb");
                        }),
                        activeColor: HexColor.fromHex("#fbeccb"),
                        value: 2,
                        groupValue: group1Value,
                        onChanged: (value) {
                          setState(() {
                            group1Value = value;
                          });
                        },
                      ),
                      Expanded(
                        child: GeneralText(
                          Strings.bottomSheetTellUsWhyRadioHint,
                          maxLines: 2,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  color: HexColor.fromHex("#fbeccb"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        visualDensity: VisualDensity.compact,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return HexColor.fromHex("#fbeccb");
                        }),
                        activeColor: HexColor.fromHex("#fbeccb"),
                        value: 3,
                        groupValue: group1Value,
                        onChanged: (value) {
                          setState(() {
                            group1Value = value;
                          });
                        },
                      ),
                      Expanded(
                        child: GeneralText(
                          Strings.bottomSheetTellUsWhyRadioHint,
                          maxLines: 2,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                            color: HexColor.fromHex("#fbeccb"),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 42,
              ),
              GeneralButton.button(
                title: Strings.generalButtonTitle.toUpperCase(),
                styleType: ButtonStyleType.fill,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomModel {
  String? name;
  String? icon;

  CustomModel({this.name, this.icon});
}
