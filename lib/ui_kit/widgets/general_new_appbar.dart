import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../services/navigation/navigation_service.dart';
import '../../setup.dart';
import '../../theme/app_theme_widget.dart';
import 'general_text.dart';

class GeneralNewAppBar extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final String? rightIcon;
  final Function? callBack;
  const GeneralNewAppBar({Key? key, this.title, this.titleColor, this.rightIcon, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final _navigationService = locateService<INavigationService>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image.asset(Resources.appBackIcon,height: 35,),
        InkWell(
            onTap: () {
              // Navigator.pop(context);
              _navigationService.navigateTo(route:const BottomBar());

              // _navigationService.replace(context);

              // _navigationService.replace(route: BottomBar());
              //    Navigator.p
            },
            child: SvgPicture.asset(
              Resources.appBackIconSVG,
              height: 33,
            ),
        ),
        if (title != null) ...[
          Spacer(),
          GeneralText(
            title ?? '',
            textAlign: TextAlign.center,
            style: appTheme.typographies.interFontFamily.headline5.copyWith(
                color: titleColor, fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ],
        if (rightIcon != null) ...[
          Spacer(),
          InkWell(
            onTap: ()=> _navigationService.navigateTo(route:const BottomBar()),
            child: SvgPicture.asset(
              rightIcon!,
              height: 25,
            ),
          ),
          SizedBox(
            width: 26,
          ),
        ]
      ],
    );
  }
}
