import 'package:chef/helpers/helpers.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await PackageInfo.fromPlatform().then((value) {
      _packageInfo = value;
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Resources.getStartedBgPng,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _getStartedTitle(appTheme: appTheme),
            const SizedBox(
              height: 12,
            ),
            _getStartedSubTitle(appTheme: appTheme),
            const SizedBox(
              height: 230,
            ),
            _getStartedButtonTitle(appTheme: appTheme),
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  ' Version ' + '${_packageInfo.version}',
                  style: appTheme.typographies.interFontFamily.headline6,
                )),
          ],
        ) /* add child content here */,
      ),
    );
  }

  Widget _getStartedTitle({required IAppThemeData appTheme}) {
    return GeneralText(
      Strings.getStartedTitle,
      textAlign: TextAlign.center,
      // style: appTheme.typographies.interFontFamily.headline4.copyWith(
      //   color: Colors.white,
      //   fontSize: 21,
      //   shadows: <Shadow>[
      //     Shadow(
      //       offset: Offset(10.0, 5.0),
      //       blurRadius: 10.0,
      //       color: Colors.black.withOpacity(0.4),
      //     ),
      //   ],
      // ),

      style: appTheme.typographies.interFontFamily.headline7.copyWith(
        height: 1.5,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(10.0, 5.0),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
    );
  }

  Widget _getStartedSubTitle({required IAppThemeData appTheme}) {
    return GeneralText(
      Strings.getStartedSubtitle,
      textAlign: TextAlign.center,

      style: appTheme.typographies.interFontFamily.headline7.copyWith(
        color: Colors.white,
        height: 1.5,

        fontWeight: FontWeight.w500,
        fontSize: 16,
        //color: _IColors.white,
        // fontSize: 15,
        // fontWeight: FontWeight.w500,
        // fontStyle:
        // fontWeight:
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(10.0, 5.0),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
      // style: appTheme.typographies.interFontFamily.headline6.copyWith(
      //   color: Colors.white,
      //   fontSize: 15,
      //   shadows: <Shadow>[
      //     Shadow(
      //       offset: Offset(10.0, 5.0),
      //       blurRadius: 10.0,
      //       color: Colors.black.withOpacity(0.4),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.getStartedButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
        //    viewModel.goToForgotPasswordScreen();
      },
    );
  }
}
