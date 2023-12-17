import 'dart:io';
import 'package:chef/services/renderer/field_renderer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import 'package:chef/services/services.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/setup.config.dart';

final getIt = GetIt.instance;

Future<dynamic> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  HttpOverrides.global = DevHttpOverrides(); // to ignore ssl certification
  return $initGetIt(getIt);
}

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();

  final _navigationService = NavigationService(_appRouter.navigatorKey);

  final _deviceService = DeviceServiceImpl();

  @singleton
  IDeviceService get deviceService => _deviceService;

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  IAppThemeData get theme => DefaultTheme();

  @preResolve
  Future<IStorageService> get sharedPreferences async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPrefs(sharedPreferences: sharedPreferences);
  }

  @singleton
  INavigationService get navigationService => _navigationService;

  @preResolve
  Future<INetworkService> get network async => NetworkCall(
        client: Client(),
        storage: await sharedPreferences,
        appService: await appService,
      );

  @singleton
  AppRouter get appRouter => _appRouter;

  @singleton
  IRendererService get fieldRendererService => FieldRenderer();

  @preResolve
  Future<ApplicationService> get appService async => ApplicationService(
        navigation: navigationService,
        storage: await sharedPreferences,
      );
}
