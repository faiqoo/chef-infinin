import 'package:chef/screens/sign_up/get_started_screen_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/splash/splash_screen_m.dart';
import 'package:chef/screens/splash/splash_screen_vm.dart';

import '../../theme/app_theme_widget.dart';

class SplashScreen extends BaseView<SplashScreenViewModel> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final _screenSize = screenSizeData.size;
    final _logoWidth = _screenSize.width * .3;
    final _logoHeight = _screenSize.height * .1;
    final appTheme = AppTheme.of(context).theme;
    viewModel.fetchLoginDetails(context);
    return BlocBuilder<SplashScreenViewModel, SplashScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: appTheme.colors.primaryBackground,
          body: Center(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()),
                );

              },
              child: SvgPicture.asset(
                Resources.chefLogo,
                width: _logoWidth,
                height: _logoHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
