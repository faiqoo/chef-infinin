import 'package:chef/models/booking/booking_list_response_model.dart';
import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../services/navigation/navigation_service.dart';
import '../../services/navigation/router.gr.dart' as nav;
import '../../setup.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/helpers/dialog_helper.dart';
import '../../ui_kit/widgets/general_button.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../home/food_item_booking_confirmed.dart';
import 'advance_payment/food_item_advance_payment_v.dart';
import 'booking_in_process_screen.dart';
// import 'food_item_advance_booking.dart';

import 'dart:developer' as developer;

class FoodItemBooking extends StatefulWidget {
  const FoodItemBooking({Key? key, this.bookingListModel}) : super(key: key);

  final BookingListModel? bookingListModel;

  @override
  State<FoodItemBooking> createState() => _FoodItemBookingState();
}

class _FoodItemBookingState extends State<FoodItemBooking> {
  List<BookingItem> bookingProgressStatus = [];
  List<BookingProgress> bookingProgres = [];

  final _navigation = locateService<INavigationService>();

  @override
  void initState() {
    var list = widget.bookingListModel?.t;
    bookingProgressStatus.addAll(list!);
    bookingProgres.addAll([
      BookingProgress(
          bookingStatusIcon: Resources.timeLapsePNG,
          statusName: Strings.foodItemBookingApprovalPending),
      BookingProgress(
          bookingStatusIcon: Resources.hourglassPNG,
          statusName: Strings.foodItemBookingAdvancePending),
      BookingProgress(
          bookingStatusIcon: Resources.confirmUserPNG,
          statusName: Strings.foodItemBookingInProgress),
      BookingProgress(
          bookingStatusIcon: Resources.paymentPNG,
          statusName: Strings.foodItemBookingBookingConfirmed),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
          backgroundColor: HexColor.fromHex("#212129"),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, top: 20, bottom: 20),
                  child: const GeneralNewAppBar(
                    rightIcon: Resources.homeIconSvg,
                    title: Strings.labelBookings,
                    titleColor: Colors.white,
                  ),
                ),
                Expanded(child: bookingDetails(appTheme)),
              ]),
        ));
  }

  Future<bool> onWillPop() async {
    return false;
  }

  String getMonthName(int month) {
    List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }

  Widget bookingDetails(IAppThemeData appTheme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: bookingProgressStatus.length,
          itemBuilder: (BuildContext context, int index) {
            var item = bookingProgressStatus[index];
            const noImage = Resources.bookingUserPNG;
            final imageUrl = item.preferenceIconPath;
            DateTime date = DateTime.parse(item.scheduleScheduledDate ?? '');
            String formattedDate = "${date.day} ${getMonthName(date.month)}";

            String timeString = item.scheduleStartTime ?? '';
            DateFormat inputFormat = DateFormat('HH:mm:ss');
            DateTime dateTime = inputFormat.parse(timeString);
            DateFormat outputFormat = DateFormat('hh a');
            String formattedTime = outputFormat.format(dateTime);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralText(
                  item.scheduleScheduledDate.toString(),
                  style: appTheme.typographies.interFontFamily.headline6
                      .copyWith(
                          fontSize: 12,
                          color: HexColor.fromHex('#fee4a4'),
                          fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 22, bottom: 40),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor.fromHex("#4b4b52")),
                  child: InkWell(
                    onTap: () {
                      //if (index == 1) {
                      if (item.bookingStatus.toString().toUpperCase() ==
                          Strings.acceptData) {
                        // _navigation.navigateTo(
                        //     route: FoodProductAdvancePendingDetails(
                        //         bookingItem: item));

                        _navigation.navigateTo(
                            route: nav.FoodItemAdvancePaymentRoute(
                                bookingItem: item));

                        //     Navigator
                        //     .push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //   return const FoodProductAdvancePendingDetails();
                        // }));
                      } else if (item.bookingStatus!.toUpperCase() ==
                          Strings.confirmed) {
                        _navigation.navigateTo(
                            route: nav.BookingInProcessRouteView(
                                bookingItem: item));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const FoodItemInProcessBooking();
                        // }));
                      } else if (index == 3) {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const FoodProductBookingConfirmedDetails();
                        // }));
                      }
                      // else{
                      //   _showGeneralPopup(context);
                      // }
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  /* (imageUrl != null) // Only use the network image if the url is not null
                        ? Image.network(
                      imageUrl,
                      loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null) ? child : CircularProgressIndicator(),
                      errorBuilder: (context, error, stackTrace) => noImage,
                    )
                        : noImage;*/
                                  Image.asset(noImage),
                                  SizedBox(
                                    width: 7.2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GeneralText(
                                        item.preferenceName ?? "",
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                                fontSize: 15,
                                                color:
                                                    HexColor.fromHex('#ffffff'),
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 13.9,
                                            child: Image.asset(
                                                Resources.bookingStarPNG,
                                                fit: BoxFit.fill),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          GeneralText(
                                            Strings.foodItemBookingReviews,
                                            style: appTheme.typographies
                                                .interFontFamily.headline6
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: HexColor.fromHex(
                                                        '#b0c18b')),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: HexColor.fromHex("#bb3127"),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: GeneralText(
                                  Strings.rsLabel + item.totalPrice.toString(),
                                  style: appTheme
                                      .typographies.interFontFamily.headline1
                                      .copyWith(
                                          fontSize: 19,
                                          color: HexColor.fromHex('#ffffff'),
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 22),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GeneralText(
                                    item.brandName ?? "",
                                    style: appTheme
                                        .typographies.interFontFamily.headline1
                                        .copyWith(
                                            fontSize: 16,
                                            color: HexColor.fromHex('#909094'),
                                            fontWeight: FontWeight.w600),
                                  ),
                                  item != null && item.persons != null
                                      ? GeneralText(
                                          item.persons! + Strings.personsLabel,
                                          style: appTheme.typographies
                                              .interFontFamily.headline1
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: HexColor.fromHex(
                                                      '#fbeccb'),
                                                  fontWeight: FontWeight.w400),
                                        )
                                      : Container(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GeneralText(
                                    "${formattedDate ?? ""} @ ${formattedTime}",
                                    style: appTheme
                                        .typographies.interFontFamily.headline1
                                        .copyWith(
                                            fontSize: 14,
                                            color: HexColor.fromHex('#ffffff'),
                                            fontWeight: FontWeight.w400),
                                  ),
                                  GeneralText(
                                    item.preferenceName ?? "",
                                    style: appTheme
                                        .typographies.interFontFamily.headline1
                                        .copyWith(
                                            fontSize: 14,
                                            color: HexColor.fromHex('#fee4a4'),
                                            fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              progressBar(
                                  appTheme,
                                  getBookingIconData(item.bookingStatus),
                                  item.bookingStatus!),
                              const SizedBox(
                                height: 23,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GeneralText(
                                    getStatus(item.bookingStatus ?? ""),
                                    //  item.bookingStatus ?? "",
                                    style: appTheme
                                        .typographies.interFontFamily.headline1
                                        .copyWith(
                                            fontSize: 16,
                                            color: HexColor.fromHex('#f1c452'),
                                            fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              item.bookingStatus?.toUpperCase() == Strings.acceptData? GeneralText(
                                "Please pay advance to confirm booking",
                                //  item.bookingStatus ?? "",
                                style:appTheme
                                    .typographies.interFontFamily.headline1
                                    .copyWith(
                                    fontSize: 13,
                                    color: HexColor.fromHex('#909094'),),
                              ):Container(),

                            ]),
                          )
                        ]),
                  ),
                ),
              ],
            );
          }),
    );
  }

  String getStatus(String status) {
    switch (status.toUpperCase()) {
      case Strings.acceptData:
        return Strings.acceptData;
      case Strings.requestedOrder:
        return Strings.pendingValue;
      case Strings.confirmed:
        return Strings.confirmed;
      case Strings.inProgress:
        return Strings.inProgressValue;
      case Strings.billGenerated:
        return Strings.billGeneratedValue;
      default:
        return "";
    }
  }

  Widget progressBar(IAppThemeData appTheme, int index, String bookingStatus) {
    var progressBar;
    developer.log(' Booking Status is ' + bookingStatus);

    if (bookingStatus.toUpperCase() == Strings.requestedOrder) {
      progressBar = Row(children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              bookingStatus == 'ACCEPTED'
                  ? Resources.hourglassPNG
                  : bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
        const SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
            width: 64,
            // width: MediaQuery.of(context).size.width / 5,
            height: 1,
            color: HexColor.fromHex("#909094")),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 5,
          height: 1,
          color: HexColor.fromHex("#909094"),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
      ]);
    }
    else if (bookingStatus.toUpperCase() == Strings.acceptData) {
      progressBar = Row(children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              Resources
                  .hourglassPNG, //   bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
            width: 64,
            // width: MediaQuery.of(context).size.width / 5,
            height: 1,
            color: HexColor.fromHex("#909094")),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 5,
          height: 1,
          color: HexColor.fromHex("#909094"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
      ]);
    }
    else if (bookingStatus.toUpperCase() == Strings.billGenerated) {
      progressBar = Row(children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              Resources
                  .billGeneratedPNG, //   bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
      ]);
    }
    else if (bookingStatus.toUpperCase() == Strings.inProgress) {
      progressBar = Row(children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              Resources
                  .paymentPNG, //   bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
      ]);
    }
    else if (bookingStatus.toUpperCase() == Strings.confirmed.toUpperCase()) {
      progressBar = Row(children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
            width: 64,
            // width: MediaQuery.of(context).size.width / 5,
            height: 1,
            color: HexColor.fromHex("#f1c452")),
        SizedBox(
          width: 2,
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 5,
          height: 1,
          color: HexColor.fromHex("#909094"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#909094"), shape: BoxShape.circle),
        ),
      ]);
    }
    else if (index == 3) {
      progressBar = Row(children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 7.5,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 6,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
            width: 64,
            // width: MediaQuery.of(context).size.width / 5,
            height: 1,
            color: HexColor.fromHex("#f1c452")),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          width: 64,
          // width: MediaQuery.of(context).size.width / 5,
          height: 1,
          color: HexColor.fromHex("#f1c452"),
        ),
        SizedBox(
          width: 2,
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.8),
            width: 36,
            decoration: BoxDecoration(
                color: HexColor.fromHex("#f1c452"), shape: BoxShape.circle),
            child: Image.asset(
              bookingProgres[index].bookingStatusIcon!,
              width: 18.5,
              height: 18.5,
            ),
          ),
        ),
      ]);
    } else {
      return Container();
    }

    return progressBar;
  }

  Future<dynamic> _showGeneralPopup(BuildContext context) async {
    final appTheme = AppTheme.of(context).theme;

    return DialogHelper.show(
      context: context,
      // dialogType: GeneralComponentStyle.success,
      isDismissible: true,
      barrierLabel: '',
      // title: 'Verification\nCode',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outlined,
              color: appTheme.colors.secondaryBackground,
              size: 45,
            ),
            GeneralText(
              Strings.generalPopupTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: appTheme.colors.secondaryBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GeneralText(
                Strings.generalSubTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: Color(0xfffee4a4),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            GeneralButton.button(
              title: Strings.generalButtonTitle.toUpperCase(),
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

  int getBookingIconData(String? bookingStatus) {
    var index = 0;
    for (int i = 0; i < bookingProgres.length; i++) {
      if (bookingStatus == bookingProgres[i].statusName) {
        index = i;
      }
    }
    return index;
  }
}

class BookingProgress {
  String? statusName;
  String? bookingStatusIcon;

  BookingProgress({this.statusName, this.bookingStatusIcon});
}
