// import 'package:chef/base/screen_layout_base/screen_layout_base_m.dart';
import 'package:chef/helpers/helpers.dart';
import 'package:chef/models/signup/profession_request.dart' as prorequest;
import 'package:firebase_auth/firebase_auth.dart';

// import '../../base/screen_layout_base/screen_layout_base_m.dart';
import '../../models/signup/profession_response.dart';
import 'dart:developer' as developer;

import '../../helpers/data_request.dart' as signuprequest;
// import '../../models/signup/signup_request.dart' as signuprequest;
import '../../models/signup/signup_request.dart';
import '../../models/signup/signup_response.dart';
import 'package:chef/screens/sign_up/sign_up_screen_m.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

@injectable
class SignUpScreenViewModel extends BaseViewModel<SignUpScreenState> {
  SignUpScreenViewModel({
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

   TextController nameController = TextController();
   TextController mobileNumberController = TextController();
   TextController ageController = TextController(text: "");
   TextController genderController = TextController(text: 'male');

  final dropdownItems = <String>[];
  Map<dynamic, dynamic> dropdownDetails = {};
  int professionID = 0;
  List<ProfessionData> _professionData = [];
  ValueNotifier<bool> buttonEnabled = ValueNotifier(false);

  void changeButton(bool? value) {

    buttonEnabled.value =  value??!buttonEnabled.value;
  }

  Future<void> loadProfessions({
    required String baseUrl,
    required BuildContext context,
  }) async {
    final url = InfininURLHelpers.getRestApiURL(baseUrl + Api.professionalList);

    emit(Loaded(_professionData));

    if (_professionData.isEmpty) {
      final professionDataRequest = prorequest.ProfessionRequest(
        t: prorequest.T(),
      ).toJson();

      final response = await _network.post(
        path: url,
        data: professionDataRequest,
      );
      final currentProfessionData = professionFromJson(response.body);
      _professionData = currentProfessionData.t;

      emit(Loaded(_professionData));
    }
  }

  bool isValidUrl(String url) => Uri.tryParse(url)?.hasAbsolutePath ?? false;
  void onFormValuesChange({
    String? email,
  }) {
    emit(
    state
    );
  }
  String updateUrl(String url) {
    if (!url.endsWith('/')) {
      url += '/';
    }
    if (!url.endsWith(Api.client)) {
      url += Api.client;
    }
    return url;
  }

  bool _validateInput({
    required String name,
    required String mobileNumber,
    required int age,
    required String gender,
    required int professionId,
  }) =>
      name.trim().isNotEmpty &&
      mobileNumber.trim().isNotEmpty &&
      age > 5 &&
      gender.isNotEmpty &&
      professionId != 0;

  Future<void> _cacheData({
    required BuildContext context,
    required loginData,
    required String baseUrl,
  }) async {
    // await _storage.writeBool(
    //   key: PreferencesKeys.sRememberUser,
    //   data:  state.rememberMe,
    //   // data: state.when(initialized: , loaded: loaded),
    // );
    await _storage.writeString(
      key: PreferencesKeys.sLoginData,
      data: loginData.toString(),
    );
    final loginDecodedData = jsonDecode(loginData.toString());
    //final currentUser = LoginResponse.fromJson(loginDecodedData);
    final currentUser = SignupResponse.fromJson(loginDecodedData);
    // await _storage.writeString(
    //   key: PreferencesKeys.sTenantId,
    //   data: currentUser.user.tenantId,
    // );
    await _storage.writeString(
      key: PreferencesKeys.sBaseUrl,
      data: baseUrl,
    );
    await _appService.loadPrefData();
  }

  void saveFoodie({
    required String name,
    required String mobileNumber,
    required int age,
    required String gender,
    required int professionId,
    required BuildContext context,
    required String baseUrl,
  }) async {
    final isInputValid = _validateInput(
      name: name,
      mobileNumber: mobileNumber,
      age: age,
      gender: gender,
      professionId: professionId,
    );
    if (isInputValid) {
      //loading(isBusy: true);
      //emit(const Loading());
      emit(Loaded(_professionData));
      try {
        final url =
            InfininURLHelpers.getRestApiURL(Api.baseURL + Api.foodieSignUp);
        signuprequest.T t = signuprequest.T(
          age: age.toString(),
          name: name,
          gender: gender,
          mobileNo: mobileNumber,
          professionalId: professionId,
          profileImageUrl: null,
        );

        final signUpCredentials = SignupRequest(
          t: t,
        ).toJson();
        final response = await _network
            .post(
              path: url,
              data: signUpCredentials,
              //   accessToken: false,
            )
            .whenComplete(() {});

        // final response = await _network.get(
        //   //below one is working
        //   path: 'https://run.mocky.io/v3/80289cbe-aa47-491e-9eb2-56126289c8a4',
        // );

        if (response != null) {
          developer.log(' Response of Signup body is ' + '${response.body}');

          SignupResponse signupResponse = signupResponseFromJson(response.body);

          Toaster.infoToast(context: context, message: signupResponse.message);

          await _cacheData(
            context: context,
            loginData: response.body,
            baseUrl: baseUrl,
          );

          developer.log(' Sign up Response is ' + signupResponse.message);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpQuestionireScreen()),
          );
        } else {
          Toaster.infoToast(
              context: context,
              message: 'Something is wrong please content vendor');
          developer.log(' Response of Signup is null ' + '$response');
        }

        //  loading(isBusy: false);
        //   _navigation.replace(route: CustomerRoute());
      } catch (error) {
        developer.log(' Error in ' + '${error}');

        Toaster.errorToast(context: context, message: '$error');
        // emit(
        //   // state.copyWith(
        //   //   isBusy: false,
        //   //   errorMessage: error.toString().contains(Api.unauthorizedRequest)
        //   //       ? Strings.invalidUsernamePassword
        //   //       : error.toString(),
        //   // ),
        // );
      }
    } else {
      Toaster.errorToast(
        context: context,
        message: Strings.signUpFields,
      );
    }
  }

  bool verifyInput({
    required String name,
    required String mobileNumber,
    required int age,
    required String gender,
    required int professionId,
    required BuildContext context,
    required String baseUrl,
  }) {
    final isInputValid = _validateInput(
      name: name,
      mobileNumber: mobileNumber,
      age: age,
      gender: gender,
      professionId: professionId,
    );
    if (!isInputValid) {
      Toaster.errorToast(
        context: context,
        message: Strings.signUpFields,
      );
      return false;
    }
    return true;
  }
  bool checkAllInputAdded() {
    var age = ageController.text;
    if(age.isEmpty){
      age="0";
    }
    final isInputValid = _validateInput(
      name: nameController.text,
      mobileNumber: mobileNumberController.text,
      age: int.parse(age),
      gender: genderController.text,
      professionId: professionID,
    );

    return isInputValid;
  }

  void loading({required bool isBusy}) => emit(const Loading());

  // Future registerUser(String mobile, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: null,
  //       timeout: null,
  //       verificationCompleted: null,
  //       verificationFailed: null,
  //       codeSent: null,
  //       codeAutoRetrievalTimeout: null);
  // }

  // Future<bool> registerUser(String phone, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (AuthCredential credential) async {
  //         Navigator.of(context).pop();
  //
  //         var result = await _auth.signInWithCredential(credential);
  //
  //         Users user = result.user;
  //
  //         if (user != null) {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => HomeScreen(
  //                         user: user,
  //                       )));
  //         } else {
  //           print("Error");
  //         }
  //
  //         //This callback would gets called when verification is done auto maticlly
  //       },
  //       verificationFailed: (AuthException exception) {
  //         print(exception);
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]) {
  //         showDialog(
  //             context: context,
  //             barrierDismissible: false,
  //             builder: (context) {
  //               return AlertDialog(
  //                 title: Text("Give the code?"),
  //                 content: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     TextField(
  //                       controller: _codeController,
  //                     ),
  //                   ],
  //                 ),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     child: Text("Confirm"),
  //                     textColor: Colors.white,
  //                     color: Colors.blue,
  //                     onPressed: () async {
  //                       final code = _codeController.text.trim();
  //                       AuthCredential credential =
  //                           PhoneAuthProvider.getCredential(
  //                               verificationId: verificationId, smsCode: code);
  //
  //                       AuthResult result =
  //                           await _auth.signInWithCredential(credential);
  //
  //                       FirebaseUser user = result.user;
  //
  //                       if (user != null) {
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => HomeScreen(
  //                                       user: user,
  //                                     )));
  //                       } else {
  //                         print("Error");
  //                       }
  //                     },
  //                   )
  //                 ],
  //               );
  //             });
  //       },
  //       codeAutoRetrievalTimeout: null);
  // }
}
