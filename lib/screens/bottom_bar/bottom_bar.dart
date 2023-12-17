import 'package:chef/screens/booking/booking_list/booking_list_screen_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../booking/food_item_booking.dart';
import '../home/widget/food_details_screen.dart';
import '../home/home_screen_v.dart';
import '../user_account/edit_profie/edit_profile_screen_v.dart';
import '../user_account/edit_profile.dart';
import '../user_account/user_profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState>? drawerKey = GlobalKey();
  BottomBarType selectedType = BottomBarType.home;
  List<Widget> screens = [
    HomeScreen(),
    // UserProfile(),
    // FoodItemBooking(),
    BookingListScreen(),
    // FoodDetailScreen(),
    UserProfile(),
    EditProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedType.index],
        bottomNavigationBar: _bottomNavigationContainer(context));
  }

  Widget _bottomNavigationContainer(BuildContext context) {
    return Container(
      // color: Color(0xff212129),
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _itemBar(context, Resources.homeIconSvg, Strings.homeTitle,
              BottomBarType.home),
          // SizedBox(
          //   width: DynamicSize.exactWidth(37, context),
          // ),
          _itemBar(context, Resources.calenderIconSvg, Strings.bookingTitle,
              BottomBarType.bookings),
          // SizedBox(
          //   width: DynamicSize.exactWidth(37, context),
          // ),
          _itemBar(context, Resources.historyRecentIconSvg,
              Strings.historyTitle, BottomBarType.history),
          // SizedBox(
          //   width: DynamicSize.exactWidth(37, context),
          // ),
          _itemBar(context, Resources.peopleIconSvg, Strings.profileTitle,
              BottomBarType.profile),
        ],
      ),
    );
  }

  Widget _itemBar(BuildContext context, String imagePath, String title,
      BottomBarType type) {
    final appTheme = AppTheme.of(context).theme;
    return InkWell(
      onTap: () {
        setState(() {
          selectedType = type;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 18,
          ),
          SizedBox(
            height: 3,
          ),
          GeneralText(
            title,
            style: appTheme.typographies.interFontFamily.headline2.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInToLinear,
              height: 3,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // radius of 10
                  color: selectedType == type
                      ? const Color(0xffb0c18b)
                      : Colors.transparent

                  // green as background color
                  )),
        ],
      ),
    );
  }
}

enum BottomBarType {
  home,
  bookings,
  history,
  profile,
}
