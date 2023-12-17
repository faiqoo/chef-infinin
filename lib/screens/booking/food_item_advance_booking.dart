import 'package:chef/helpers/helpers.dart';
import 'package:chef/services/renderer/field_renderer_helpers.dart';
import 'package:chef/setup.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../helpers/function_helper.dart';
import '../../models/booking/advance_pending_response.dart';
import '../../models/booking/booking_list_response_model.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_button.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../booking/food_item_booking.dart';

import 'dart:developer' as developer;

import 'advance_payment/food_item_advance_payment_vm.dart';

class FoodProductAdvancePendingDetails extends StatefulWidget {
  const FoodProductAdvancePendingDetails(
      {Key? key, required AdvancePendingResponse advancePendingDetails})
      : _advancePendingDetails = advancePendingDetails,
        super(key: key);

  final AdvancePendingResponse _advancePendingDetails;

  @override
  State<FoodProductAdvancePendingDetails> createState() =>
      _FoodProductAdvancePendingDetailsState();
}

class _FoodProductAdvancePendingDetailsState
    extends State<FoodProductAdvancePendingDetails> {
  List<CustomModel> wowFactorsList = [];
  List<CustomModel> menuListItems = [];
  bool checkValue = false;

  @override
  void initState() {
    developer.log(' Booking bookingStatus here is ' +
        widget._advancePendingDetails.t.bookingStatus);

    loadMenu();
    loadWowFactor();
    // wowFactorsList.addAll([
    //   CustomModel(
    //       name: Strings.productDetailWowFactorGarden,
    //       icon: "assets/images/icons/garden.png"),
    //   CustomModel(
    //       name: Strings.productDetailWowFactorFireworks,
    //       icon: "assets/images/icons/fireworks.png"),
    //   CustomModel(
    //       name: Strings.productDetailWowFactorPetFriendly,
    //       icon: "assets/images/icons/pet_friendly.png"),
    //   CustomModel(
    //       name: Strings.productDetailWowFactorWifi,
    //       icon: "assets/images/icons/wifi_2.png"),
    //   CustomModel(
    //       name: Strings.productDetailWowFactorMusic,
    //       icon: "assets/images/icons/music.png"),
    //   CustomModel(
    //       name: Strings.productDetailWowFactorParking,
    //       icon: "assets/images/icons/parking.png")
    // ]);
    super.initState();
  }

  void loadMenu() {
    for (var i = 0;
        i < widget._advancePendingDetails.t.experienceMenu.length;
        i++) {
      menuListItems.addAll([
        CustomModel(
          name: widget._advancePendingDetails.t.experienceMenu[i].dish,
          price: widget._advancePendingDetails.t.experienceMenu[i].price
              .toString(),
        ),
        // CustomModel(name: "Buritto"),
        // CustomModel(name: "Vegetable Salad"),
        // CustomModel(name: "Hyderabadi Rice"),
        // CustomModel(name: "Soft Drinks"),
      ]);
    }
  }

  void loadWowFactor() {
    for (var i = 0;
        i <
            widget._advancePendingDetails.t.experience.experienceWowFactors
                .length;
        i++) {
      wowFactorsList.add(
        CustomModel(
          name: widget._advancePendingDetails.t.experience
              .experienceWowFactors[i].wowFactorName,
          icon: widget._advancePendingDetails.t.experience
              .experienceWowFactors[i].wowFactorIconPath,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget._advancePendingDetails.t.bookingStatus
                  .toString()
                  .toUpperCase() ==
              Strings.acceptData
          ? getStartedButtonTitle(appTheme: appTheme)
          : Container(),
      body: Container(
          color: HexColor.fromHex("#212129"),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 217,
                padding: const EdgeInsets.only(left: 33, bottom: 17),
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
                    Column(
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
                            Strings.byText +
                                ' ' +
                                widget._advancePendingDetails.t.brandName,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#909094'),
                            ),
                          ),
                          SizedBox(
                            height: 4,
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
                            Strings.foodItemBookingAdvancePendingHeader
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
                    const Positioned.fill(
                      top: 40,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GeneralNewAppBar(
                            rightIcon: Resources.homeIconSvg,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 33.9,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                                  style: appTheme
                                      .typographies.interFontFamily.headline6
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
                                //   widget.bookingListModel.t[]
                                // widget._bookingItem.
                                //   Strings.productDetailAboutSubTitle,
                                widget._advancePendingDetails.t.experience
                                    .description,
                                style: appTheme
                                    .typographies.interFontFamily.headline6
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
                                  style: appTheme
                                      .typographies.interFontFamily.headline6
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
                      chefInformation(appTheme),
                      const SizedBox(
                        height: 47.9,
                      ),
                      productPriceInformation(appTheme),
                      const SizedBox(
                        height: 32.9,
                      ),
                      extraPaymentNotes(appTheme),
                      SizedBox(
                        height: 42,
                      ),
                      checkTermsConditions(appTheme),
                      SizedBox(
                        height: 209.1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget wowFactors(IAppThemeData appTheme) {
    return Container(
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
                    height: 63.3,
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
                      // child: Image.asset(wowFactorsList[i].icon != null
                      //     ? wowFactorsList[i].icon ?? ""
                      //     : ''),

                      child: SvgPicture.network(wowFactorsList[i].icon != null
                          ? wowFactorsList[i].icon ?? ""
                          : ''),
                    ),
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
    DateTime dateTime =
        widget._advancePendingDetails.t.scheduleScheduledDate ?? DateTime.now();
    // DateTime dateTime = DateTime.parse(dateValue);
    String monthAbbreviation =
        FunctionHelper().getMonthAbbreviation(dateTime.month);
    String dayAbbreviation =
        FunctionHelper().getDayAbbreviation(dateTime.weekday);

    var _hourSelected = widget._advancePendingDetails.t.scheduleStartTime ?? "";

    var _productDetailSelectionDate = dayAbbreviation +
        ',  ' +
        (dateTime.day.toString()) +
        " " +
        monthAbbreviation;

    var _productDetailSelectionTime = InfininURLHelpers.getAmPm(
        widget._advancePendingDetails.t.scheduleStartTime ?? "");
    var _productDetailSelectionType =
        widget._advancePendingDetails.t.preferenceName ?? "";
    var _numberOfPerson = widget._advancePendingDetails.t.persons ?? '';

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.only(
              top: 22, bottom: 29, start: 10, end: 10),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#4b4b52"),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(
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
                            // Strings.productDetailSelectionDate,
                            _productDetailSelectionDate,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#ea7458'),
                            ),
                          ),
                          GeneralText(
                            //  Strings.productDetailSelectionTime,
                            _productDetailSelectionTime,
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
                            // Strings.productDetailSelectionType,
                            _productDetailSelectionType,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#8ea659'),
                            ),
                          ),
                          GeneralText(
                            //    Strings.productDetailSelectionTotalPersons,
                            _numberOfPerson,
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
            // Strings.productDetailSelectionNotes,
            widget._advancePendingDetails.t.comments,
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
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
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
                          // Strings.productDetailSelectionMenuAmount,
                          menuListItems[index].price.toString(),
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
        )
        /* GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
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
                borderRadius: BorderRadius.circular(15)),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          // Strings.productDetailChefName,
                          widget._advancePendingDetails.t.experience
                              .chefBrandName,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                            fontSize: 18,
                            color: HexColor.fromHex('#f1c452'),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: 10.8,
                                child: Image.asset(
                                    "assets/images/icons/location_pin.png")),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GeneralText(
                                // Strings.productDetailChefLocation,
                                widget._advancePendingDetails.t.experience
                                    .chefAddress,
                                style: appTheme
                                    .typographies.interFontFamily.headline6
                                    .copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                  //Strings.productDetailChefSubHostName,
                  widget._advancePendingDetails.t.experience.subHostName,
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
                width: 7.2,
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
            height: 12.1,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
                top: 22, bottom: 22, start: 23, end: 23),
            decoration: BoxDecoration(
                color: HexColor.fromHex("#4b4b52"),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GeneralText(
                        // Strings.productDetailPriceValue,
                        widget._advancePendingDetails.t.totalPrice.toString(),
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
                      // Strings.productDetailPriceTaxValue,

                      widget._advancePendingDetails.t.tax.toString(),
                      // .chefBrandName,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralText(
                      Strings.productDetailAdvancePayment,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                    GeneralText(
                      // Strings.productDetailAdvancePaymentValue,
                      widget._advancePendingDetails.t.advancePayment.toString(),
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 15,
                        color: HexColor.fromHex('#ffffff'),
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

  Widget extraPaymentNotes(IAppThemeData appTheme) {
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
                Strings.productDetailExtraNote,
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
                color: HexColor.fromHex("#bb3127"),
                borderRadius: BorderRadius.circular(15)),
            child: GeneralText(
              Strings.productDetailExtraNoteValue,
              style: appTheme.typographies.interFontFamily.headline6.copyWith(
                fontSize: 14,
                color: HexColor.fromHex('#ffffff'),
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  Widget checkTermsConditions(IAppThemeData appTheme) {
    return Container(
      // padding: EdgeInsetsDirectional.only(start: 25, end: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: HexColor.fromHex('#f1c452'),
            ),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              checkColor: HexColor.fromHex('#f1c452'),
              activeColor: Colors.red,
              value: checkValue,
              onChanged: (bool? value) {
                setState(() {
                  checkValue = value!;
                });
              },
            ),
          ),
          GeneralText(
            Strings.foodItemAdvancePendingTermsCondition,
            style: appTheme.typographies.interFontFamily.headline6.copyWith(
              decoration: TextDecoration.underline,
              fontSize: 18,
              color: HexColor.fromHex('#f1c452'),
            ),
          ),
          // GeneralCheckbox(
          //   controlAffinity: ControlAffinity.trailing,
          //
          //   decoration: InputDecoration(iconColor: Colors.red,).copyWith(iconColor: Colors.red,),
          //     title: Icon(Icons.check_box_outline_blank,),
          //     name: "Terms & Conditions")
          // Row(
          //   children: [
          //     Container(
          //       color: HexColor.fromHex('#f1c452'),
          //       width: 16,
          //       height: 1,
          //     ),
          //     const SizedBox(
          //       width: 2,
          //     ),
          //     GeneralText(
          //       Strings.productDetailExtraNote,
          //       style: appTheme.typographies.interFontFamily.headline6.copyWith(
          //         fontSize: 20,
          //         color: HexColor.fromHex('#f1c452'),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 13.1,
          // ),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsetsDirectional.only(
          //       top: 22, bottom: 22, start: 23, end: 23),
          //   decoration: BoxDecoration(
          //       color: HexColor.fromHex("#bb3127"),
          //       borderRadius: BorderRadius.circular(20)),
          //   child: GeneralText(
          //     Strings.productDetailExtraNoteValue,
          //     style: appTheme.typographies.interFontFamily.headline6.copyWith(
          //       fontSize: 14,
          //       color: HexColor.fromHex('#ffffff'),
          //     ),
          //     maxLines: 2,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.foodItemBookingAdvancePendingButton.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        final _foodItemAdvance =
            locateService<FoodItemAdvancePaymentViewModel>();
        _foodItemAdvance
            .requestConfirmBooking(widget._advancePendingDetails.t.id);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => FoodItemBooking()));
      },
    );
    // ExtoText(
    //   Strings.getStartedButtonTitle,
    //   style: appTheme.typographies.interFontFamily.headline2,
    // );
  }
}

class CustomModel {
  String? name;
  String? icon;
  String? price;

  CustomModel({this.name, this.icon, this.price});
}
