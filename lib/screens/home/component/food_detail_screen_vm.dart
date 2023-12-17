import 'dart:async';

import 'package:chef/helpers/helpers.dart';
import 'package:chef/models/home/food_menu_request.dart' as menurequest;
import 'package:chef/screens/home/schedule_model.dart';

import '../../../models/home/food_menu_request.dart';
import '../../../models/perferences/perference_response.dart';
import '../../../models/perferences/perferences_request.dart';
import '../../../setup.dart';
import '../../food_product_experience_details/food_product_details_screen_v.dart';
import '../food_details_menu_model.dart';
import 'food_detail_screen_m.dart';

import '../../../models/home/experience_list_response.dart' as experience_data;

import 'dart:developer' as developer;

@injectable
class FoodDetailScreenViewModel extends BaseViewModel<FoodDetailScreenState> {
  FoodDetailScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(const Loading());

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  // Future<void> getExperienceMenu({
  // }) async {
  //   final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.experienceMenu);
  //   // emit(const Loading());
  //
  //   emit(const Loading());
  //   final professionDataRequest = prorequest.ProfessionRequest(
  //     t: prorequest.T(),
  //   ).toJson();
  //
  //   final response = await _network.post(
  //     path: url,
  //     data: professionDataRequest,
  //   );
  //
  //   final foodMenuData = foodMenuModelFromJson(response.body);
  //   emit(Loaded(foodMenuData));
  //
  //   // List<ProfessionData> data = currentProfessionData.t;
  //   // emit(Loaded(currentProfessionData));
  // }
  late FoodMenuModel foodMenuData;
  late String expId;

  Future<void> getExperienceMenu({required String experienceId}) async {
    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.experienceMenu);
    // emit(const Loading());
    expId = experienceId;
    emit(const Loading());

    developer.log(' Experience Id to fetch menu is ' + '${experienceId}');
    final foodMenuRequest = menurequest.FoodMenuRequest(
      t: int.parse(experienceId),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    foodMenuData = foodMenuModelFromJson(response.body);

    getScheduleData(experienceId: experienceId, foodMenuModel: foodMenuData);
    //  emit(Loaded(foodMenuData));

    // List<ProfessionData> data = currentProfessionData.t;
    // emit(Loaded(currentProfessionData));
  }

  Future<void> getScheduleData({
    required String experienceId,
    required FoodMenuModel foodMenuModel,
  }) async {
    final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.scheduleData);
    // emit(const Loading());

    final scheduleRequest = menurequest.FoodMenuRequest(
      t: int.parse(experienceId),
    ).toJson();

    final response = await _network.post(path: url, data: scheduleRequest);

    debugPrint("schedule response\n" + response.body.toString());

    final scheduleData = scheduleModelFromJson(response.body);
    emit(Loaded(foodMenuModel, scheduleData));
    // loadPreference(foodMenuModel: foodMenuModel, scheduleData: scheduleData);
  }

  void loadPreference({
    required FoodMenuModel foodMenuModel,
    required ScheduleModel scheduleData,
  }) async {
    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.preferenceAPI);

    // T t = loginrequest.T(
    //   mobileNo: mobileNumber,
    // );

    final requestPeference = PerferencesRequest(
      t: DataRequest(),
    ).toJson();

    final _header = <String, String>{
      Api.headerAcceptKey: Api.headerAcceptTypeValue
    };

    // final questionsDataRequest = questionirerequest.QuestionireRequest(
    //   t: questionirerequest.T(category: "CHEF_PROFILE"),
    // ).toJson();
    final response = await _network.post(
      path: url,
      data: requestPeference,
    );

    final _preferenceResponse = perferenceResponseFromJson(response.body);

    emit(Loaded(foodMenuModel, scheduleData));
  }

  void loading({required bool isBusy}) => emit(const Loading());

  void verifyAction(BuildContext context, String _selectedExperienceId,
      experience_data.T _experienceData) {
    final _appService = locateService<ApplicationService>();

    var orderHelper = _appService.state.orderHelper;
    if (orderHelper != null &&
        orderHelper.scheduleId != null &&
        orderHelper.scheduleId != '0' &&
        orderHelper.daysGroup != null &&
        orderHelper.daysGroup.dayOfMonth != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodProductExperienceDetailsScreenView(
                  experienceData: _experienceData,
                  selectedExperienceId: _selectedExperienceId,
                  foodMenuDetail: foodMenuData,
                )),
      );
    } else {
      Toaster.infoToast(
          context: context, message: 'Please select all the requisite data');
    }
  }

  String getValidUrlForImages(String imagePath) {
    String baseUrl = Api.baseURL;
    baseUrl = baseUrl
        .replaceAll("feyst-service", "feyst-media")
        .replaceAll(":8080", '');
    baseUrl = baseUrl + imagePath;
    return baseUrl;
  }
}
