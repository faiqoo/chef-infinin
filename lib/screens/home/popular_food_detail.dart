import 'package:chef/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../ui_kit/widgets/general_new_appbar.dart';
import '../../ui_kit/widgets/general_rich_text.dart';
import '../../ui_kit/widgets/general_text.dart';

class PopularFoodDetails extends StatefulWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  State<PopularFoodDetails> createState() => _PopularFoodDetailsState();
}

class _PopularFoodDetailsState extends State<PopularFoodDetails> {
  List<CustomModel> wowFactorsList = [];

  @override
  void initState() {
    // TODO: implement initState
    wowFactorsList.addAll([
      CustomModel(
          icon: Strings.productDetailWowFactorGarden,
          name: "assets/images/icons/garden.png"),
      CustomModel(
          icon: Strings.productDetailWowFactorMusic,
          name: "assets/images/icons/music.png"),
      CustomModel(
          icon: Strings.productDetailWowFactorFireworks,
          name: "assets/images/icons/fireworks.png"),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      backgroundColor: HexColor.fromHex("#212129"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 12),
            child: GeneralNewAppBar(
              title: Strings.popularFoodDetailAppBarTitle,
              titleColor: Colors.white,
              rightIcon: Resources.homeIconSvg,
            ),
          ),
          Expanded(child: allPopularFoodItemList(appTheme)),
        ],
      ),
    );
  }

  Widget allPopularFoodItemList(IAppThemeData appTheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.only(left: 33, bottom: 17),
              decoration: BoxDecoration(
                  color: HexColor.fromHex("#4b4b52"),
                  borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(children: [
                  Positioned(
                    right: -50,
                    top: -40,
                    child: Container(
                      width: 173,
                      padding: const EdgeInsetsDirectional.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/icons/food_product_ring.png'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/icons/food_product_experience.png',
                        fit: BoxFit.fill,
                        height: 150,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.2,
                      ),
                      GeneralRichText(
                        title: Strings.popularFoodDetailTitle,
                        titleStyle:
                            appTheme.typographies.interFontFamily.label11,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      GeneralText(
                        Strings.popularFoodDetailSubTitle,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                          fontSize: 12,
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
                            child: Image.asset('assets/images/icons/star.png',
                                fit: BoxFit.fill),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GeneralText(
                            Strings.popularFoodDetailReview,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    fontSize: 14,
                                    color: HexColor.fromHex('#8ea659')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 11.7,
                      ),
                      GeneralText(
                        Strings.popularFoodDetailWowFactorTitle,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                fontSize: 16,
                                color: HexColor.fromHex(
                                  '#ffffff',
                                ),
                                fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 11.7,
                      ),
                      wowFactors(appTheme),
                    ],
                  )
                ]),
              ),
            );
          }),
    );
  }

  Widget wowFactors(IAppThemeData appTheme) {
    return Wrap(
      children: [
        for (int i = 0; i < wowFactorsList.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 8.1, bottom: 7.7),
            child: Container(
              width: 61,
              padding: const EdgeInsetsDirectional.all(22),
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/icons/black_image_ring.png'),
                ),
              ),
              child: Container(
                child: Image.asset(
                  wowFactorsList[i].name != null
                      ? wowFactorsList[i].name ?? ""
                      : '',
                  color: HexColor.fromHex("#f1c452"),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class CustomModel {
  String? name;
  String? icon;

  CustomModel({this.name, this.icon});
}
