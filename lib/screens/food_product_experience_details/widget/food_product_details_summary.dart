import 'package:chef/screens/home/food_details_menu_model.dart';
import 'package:chef/screens/home/home_screen_v.dart';
import 'package:flutter/material.dart';

import '../../../constants/resources.dart';
import '../../../constants/strings.dart';
import '../../../helpers/color_helper.dart';
import '../../../helpers/order_helper.dart';
import '../../../helpers/url_helper.dart';
import '../../../services/application_state.dart';
import '../../../setup.dart';
import '../../../theme/app_theme_data/app_theme_data.dart';
import '../../../theme/app_theme_widget.dart';
import '../../../ui_kit/widgets/general_button.dart';
import '../../../ui_kit/widgets/general_new_appbar.dart';
import '../../../ui_kit/widgets/general_text.dart';
import '../../bottom_bar/bottom_bar.dart';
import '../../../models/home/experience_list_response.dart' as experience_data;

import 'dart:developer' as developer;

class FoodProductDetailsSummary extends StatefulWidget {
  //const FoodProductExperienceDetails({Key? key}) : super(key: key);
  // const FoodProductExperienceDetails({
  //   required String selectedExperienceId,
  //   required experience_data.T experienceData,
  //   required FoodMenuModel foodMenuModel,
  //   Key? key,
  // });

  const FoodProductDetailsSummary({
    Key? key,
    // required String selectedExperienceId,
    // required experience_data.T experienceData,
    // required FoodMenuModel foodMenuModel,

    required this.experienceData,
    required this.foodMenuDetail,
    required this.selectedExperienceId,
  }) : super(key: key);

  final experience_data.T experienceData;
  final FoodMenuModel foodMenuDetail;
  final String selectedExperienceId;

  @override
  State<FoodProductDetailsSummary> createState() =>
      _FoodProductDetailsSummaryState();
}

class _FoodProductDetailsSummaryState extends State<FoodProductDetailsSummary> {
  List<CustomModel> wowFactorsList = [];
  List<CustomModel> menuListItems = [];
  final _appService = locateService<ApplicationService>();

  @override
  void initState() {
    //widget.foodMenuModel;
    // TODO: implement initState

    //widget.foodMenuDetail.t

    // menuListItems.addAll([
    //   CustomModel(name: "Sindhi Biryani"),
    //   CustomModel(name: "Buritto"),
    //   CustomModel(name: "Vegetable Salad"),
    //   CustomModel(name: "Hyderabadi Rice"),
    //   CustomModel(name: "Soft Drinks"),
    // ]);
    loadMenuSelected();
    loadWowFactors();

    super.initState();
  }

  void loadMenuSelected() {
    for (var i = 0; i < widget.foodMenuDetail.t.length; i++) {
      developer.log(
          ' Widget  Food Menu Detail ' + '${widget.foodMenuDetail.t[i].dish}');
      menuListItems.add(CustomModel(name: widget.foodMenuDetail.t[i].dish));
    }
  }

  void loadWowFactors() {
    for (int i = 0;
    i < widget.experienceData.experienceWowFactors.length;
    i++) {
      wowFactorsList.add(CustomModel(
          name: widget.experienceData.experienceWowFactors[i]
              .wowFactorName, //   Strings.productDetailWowFactorGarden,
          icon: "assets/images/icons/garden.png"));
    }

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
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButton: getStartedButtonTitle(appTheme: appTheme),
      body: SingleChildScrollView(
        child: Container(
            color: HexColor.fromHex("#212129"),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 217,
                  padding: EdgeInsets.only(left: 33, bottom: 17),
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
                              widget.experienceData.title,
                              style: appTheme
                                  .typographies.interFontFamily.headline6
                                  .copyWith(
                                fontSize: 22,
                                color: HexColor.fromHex('#f1c452'),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GeneralText(
                              widget.experienceData.chefBrandName,
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
                      Positioned.fill(
                        top: 40,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: () {
                                  // Navigator.popUntil(
                                  //     context, (route) => HomeScreen());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const BottomBar()),
                                  );
                                },
                                child: GeneralNewAppBar(
                                  rightIcon: Resources.homeIconSvg,
                                ))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33.9,
                ),
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
                            width: 2,
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
                          // Strings.productDetailAboutSubTitle,
                          widget.experienceData.description,
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
                            width: 2,
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
                  height: 45.9,
                ),
                productPriceInformation(appTheme),
                const SizedBox(
                  height: 28,
                ),
                extraPaymentNotes(appTheme),
                SizedBox(
                  height: 209.1,
                ),
              ],
            )),
      ),
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
              padding: const EdgeInsets.only(right: 15.1, bottom: 7.7),
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
    OrderHelper orderHelper = (_appService.state.orderHelper)!;
    developer.log(' Schedule Id selected in Summary Page ' +
        _appService.state.orderHelper!.scheduleId);
    developer.log(' Schedule Id selected in Experience Price ' +
        '${_appService.state.orderHelper!.selectedExperienceDetail.price}');
    developer.log(' Schedule Id selected in Experience Id ' +
        '${_appService.state.orderHelper!.selectedExperienceDetail.id}');
    developer.log(' Foodie Id is ' + '${_appService.state.userInfo!.t.id}');
    developer.log(' Order Helper Id is ' +
        '${_appService.state.orderHelper!.daysGroup.scheduledDate.month}');
    var _date = InfininURLHelpers.dayOfMonth(
        _appService.state.orderHelper!.daysGroup.scheduledDate);
    var dayOfMonth = _appService.state.orderHelper!.daysGroup.scheduledDate.day;
    var _month = InfininURLHelpers.months[
    _appService.state.orderHelper!.daysGroup.scheduledDate.month - 1];
    var _hourSelected = _appService.state.orderHelper!.hourSelected.startTime;

    developer.log(' _Date for Summary Page is ' + '${_date}');
    developer.log(' Month of Summary Page is ' + '${_month}');

    developer.log(' Day of Month is ' + '${dayOfMonth}');
    developer.log(' Hour selected of Month is ' + '${_hourSelected}');

    var _productDetailSelectionDate = _date.toUpperCase() +
        ',  ' +
        (dayOfMonth.toString())! +
        "   " +
        _month.toString().toUpperCase();
    var _productDetailSelectionTime = InfininURLHelpers.getAmPm(
        _appService.state.orderHelper!.hourSelected.startTime);
    var _productDetailSelectionType =
        _appService.state.orderHelper!.selectedCategory;
    var _numberOfPerson =
        _appService.state.orderHelper!.numberOfPerson ?? 4.toString();
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
                    children: [
                      Column(
                        children: [
                          GeneralText(
                            //    Strings.productDetailSelectionDate,
                            _productDetailSelectionDate,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                              fontSize: 14,
                              color: HexColor.fromHex('#ea7458'),
                            ),
                          ),
                          GeneralText(
                            //   Strings.productDetailSelectionTime,
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
                            //   Strings.productDetailSelectionTotalPersons,
                            _numberOfPerson.toString(),
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
    var _noteAdded = _appService.state.orderHelper!.noteAdded ?? '';
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
            _noteAdded,
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
                        widget.experienceData.priceTypeId != 1
                            ? GeneralText(
                          Strings.productDetailSelectionMenuAmount,
                          style: appTheme
                              .typographies.interFontFamily.headline2
                              .copyWith(
                            fontSize: 16,
                            color: HexColor.fromHex('#909094'),
                          ),
                        )
                            : Container(),
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
        /*     GridView.builder(
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
                width: 2,
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
                      width: 43,
                      height: 43,
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
                        Strings.productDetailChefName,
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
                              height: 14.4,
                              child: Image.asset(
                                  "assets/images/icons/location_pin.png")),
                          SizedBox(
                            width: 5,
                          ),
                          GeneralText(
                            Strings.productDetailChefLocation,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                fontSize: 14,
                                color: HexColor.fromHex('#ffffff'),
                                decoration: TextDecoration.underline),
                          ),
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
                SizedBox(
                  height: 1.7,
                ),
                GeneralText(
                  widget.experienceData
                      .subHostName, //    Strings.productDetailChefSubHostName,
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
                width: 2,
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
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GeneralText(
                        // Strings.productDetailPriceValue,
                        widget.experienceData.price.toString(),
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
                      (widget.experienceData.price * 0.17).toStringAsFixed(2),
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
                      (widget.experienceData.price * 0.20).toStringAsFixed(2),
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
                width: 2,
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

  Widget getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.productDetailButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        //viewModel.
        // Navigator.push(
        //     context,
        //     //HomeScreen()
        //     MaterialPageRoute(builder: (context) => BottomBar()));
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

  CustomModel({this.name, this.icon});
}
