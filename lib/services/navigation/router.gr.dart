// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../models/booking/advance_pending_response.dart' as _i13;
import '../../models/booking/booking_list_response_model.dart' as _i14;
import '../../screens/booking/advance_payment/food_item_advance_payment_v.dart'
    as _i6;
import '../../screens/booking/booking_confirmed/booking_in_process_screen_v.dart'
    as _i7;
import '../../screens/booking/booking_in_process_screen.dart' as _i8;
import '../../screens/booking/food_item_advance_booking.dart' as _i5;
import '../../screens/bottom_bar/bottom_bar.dart' as _i10;
import '../../screens/home/food_item_booking_confirmed.dart' as _i9;
import '../../screens/screen.dart' as _i1;
import '../../screens/sign_in/sign_in_screen_v.dart' as _i4;
import '../../screens/sign_up/get_started_screen_v.dart' as _i2;
import '../../screens/sign_up/sign_up_screen_v.dart' as _i3;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(key: args.key),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.GetStartedScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignUpScreen(
          isVerified: args.isVerified,
          key: args.key,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ForgotPasswordScreen(
          baseUrl: args.baseUrl,
          key: args.key,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SignInScreen(key: args.key),
      );
    },
    FoodProductAdvancePendingDetails.name: (routeData) {
      final args = routeData.argsAs<FoodProductAdvancePendingDetailsArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FoodProductAdvancePendingDetails(
          key: args.key,
          advancePendingDetails: args.advancePendingDetails,
        ),
      );
    },
    FoodItemAdvancePaymentRoute.name: (routeData) {
      final args = routeData.argsAs<FoodItemAdvancePaymentRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.FoodItemAdvancePaymentScreen(
          bookingItem: args.bookingItem,
          key: args.key,
        ),
      );
    },
    BookingInProcessRouteView.name: (routeData) {
      final args = routeData.argsAs<BookingInProcessRouteViewArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.BookingInProcessScreenView(
          bookingItem: args.bookingItem,
          key: args.key,
        ),
      );
    },
    FoodItemInProcessBooking.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.FoodItemInProcessBooking(),
      );
    },
    FoodProductBookingConfirmedDetails.name: (routeData) {
      final args = routeData.argsAs<FoodProductBookingConfirmedDetailsArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.FoodProductBookingConfirmedDetails(
          key: args.key,
          advancePendingDetails: args.advancePendingDetails,
        ),
      );
    },
    BottomBar.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.BottomBar(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          GetStartedRoute.name,
          path: '/get_started_screen',
        ),
        _i11.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i11.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgotPassword',
        ),
        _i11.RouteConfig(
          SignInRoute.name,
          path: '/login',
        ),
        _i11.RouteConfig(
          FoodProductAdvancePendingDetails.name,
          path: '/foodProductAdvancePendingDetails/:advancePendingDetails',
        ),
        _i11.RouteConfig(
          FoodItemAdvancePaymentRoute.name,
          path: '/foodItemAdvancePaymentScreen/:bookingItem',
        ),
        _i11.RouteConfig(
          BookingInProcessRouteView.name,
          path: '/foodInProcessScreen/:bookedItem',
        ),
        _i11.RouteConfig(
          FoodItemInProcessBooking.name,
          path: '/foodItemInProcessScreen',
        ),
        _i11.RouteConfig(
          FoodProductBookingConfirmedDetails.name,
          path:
              '/foodProductBookingConfirmedDetailsScreen/:bookingConfirmedDetails',
        ),
        _i11.RouteConfig(
          BottomBar.name,
          path: '/bottomBar',
        ),
        _i11.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i12.Key? key})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(key: key),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.GetStartedScreen]
class GetStartedRoute extends _i11.PageRouteInfo<void> {
  const GetStartedRoute()
      : super(
          GetStartedRoute.name,
          path: '/get_started_screen',
        );

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    dynamic isVerified,
    _i12.Key? key,
  }) : super(
          SignUpRoute.name,
          path: '/signUp',
          args: SignUpRouteArgs(
            isVerified: isVerified,
            key: key,
          ),
        );

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.isVerified,
    this.key,
  });

  final dynamic isVerified;

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{isVerified: $isVerified, key: $key}';
  }
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i11.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    required String baseUrl,
    _i12.Key? key,
  }) : super(
          ForgotPasswordRoute.name,
          path: '/forgotPassword',
          args: ForgotPasswordRouteArgs(
            baseUrl: baseUrl,
            key: key,
          ),
        );

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    required this.baseUrl,
    this.key,
  });

  final String baseUrl;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{baseUrl: $baseUrl, key: $key}';
  }
}

/// generated route for
/// [_i4.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i12.Key? key})
      : super(
          SignInRoute.name,
          path: '/login',
          args: SignInRouteArgs(key: key),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.FoodProductAdvancePendingDetails]
class FoodProductAdvancePendingDetails
    extends _i11.PageRouteInfo<FoodProductAdvancePendingDetailsArgs> {
  FoodProductAdvancePendingDetails({
    _i12.Key? key,
    required _i13.AdvancePendingResponse advancePendingDetails,
  }) : super(
          FoodProductAdvancePendingDetails.name,
          path: '/foodProductAdvancePendingDetails/:advancePendingDetails',
          args: FoodProductAdvancePendingDetailsArgs(
            key: key,
            advancePendingDetails: advancePendingDetails,
          ),
        );

  static const String name = 'FoodProductAdvancePendingDetails';
}

class FoodProductAdvancePendingDetailsArgs {
  const FoodProductAdvancePendingDetailsArgs({
    this.key,
    required this.advancePendingDetails,
  });

  final _i12.Key? key;

  final _i13.AdvancePendingResponse advancePendingDetails;

  @override
  String toString() {
    return 'FoodProductAdvancePendingDetailsArgs{key: $key, advancePendingDetails: $advancePendingDetails}';
  }
}

/// generated route for
/// [_i6.FoodItemAdvancePaymentScreen]
class FoodItemAdvancePaymentRoute
    extends _i11.PageRouteInfo<FoodItemAdvancePaymentRouteArgs> {
  FoodItemAdvancePaymentRoute({
    required _i14.BookingItem bookingItem,
    _i12.Key? key,
  }) : super(
          FoodItemAdvancePaymentRoute.name,
          path: '/foodItemAdvancePaymentScreen/:bookingItem',
          args: FoodItemAdvancePaymentRouteArgs(
            bookingItem: bookingItem,
            key: key,
          ),
        );

  static const String name = 'FoodItemAdvancePaymentRoute';
}

class FoodItemAdvancePaymentRouteArgs {
  const FoodItemAdvancePaymentRouteArgs({
    required this.bookingItem,
    this.key,
  });

  final _i14.BookingItem bookingItem;

  final _i12.Key? key;

  @override
  String toString() {
    return 'FoodItemAdvancePaymentRouteArgs{bookingItem: $bookingItem, key: $key}';
  }
}

/// generated route for
/// [_i7.BookingInProcessScreenView]
class BookingInProcessRouteView
    extends _i11.PageRouteInfo<BookingInProcessRouteViewArgs> {
  BookingInProcessRouteView({
    required _i14.BookingItem bookingItem,
    _i12.Key? key,
  }) : super(
          BookingInProcessRouteView.name,
          path: '/foodInProcessScreen/:bookedItem',
          args: BookingInProcessRouteViewArgs(
            bookingItem: bookingItem,
            key: key,
          ),
        );

  static const String name = 'BookingInProcessRouteView';
}

class BookingInProcessRouteViewArgs {
  const BookingInProcessRouteViewArgs({
    required this.bookingItem,
    this.key,
  });

  final _i14.BookingItem bookingItem;

  final _i12.Key? key;

  @override
  String toString() {
    return 'BookingInProcessRouteViewArgs{bookingItem: $bookingItem, key: $key}';
  }
}

/// generated route for
/// [_i8.FoodItemInProcessBooking]
class FoodItemInProcessBooking extends _i11.PageRouteInfo<void> {
  const FoodItemInProcessBooking()
      : super(
          FoodItemInProcessBooking.name,
          path: '/foodItemInProcessScreen',
        );

  static const String name = 'FoodItemInProcessBooking';
}

/// generated route for
/// [_i9.FoodProductBookingConfirmedDetails]
class FoodProductBookingConfirmedDetails
    extends _i11.PageRouteInfo<FoodProductBookingConfirmedDetailsArgs> {
  FoodProductBookingConfirmedDetails({
    _i12.Key? key,
    required _i13.AdvancePendingResponse advancePendingDetails,
  }) : super(
          FoodProductBookingConfirmedDetails.name,
          path:
              '/foodProductBookingConfirmedDetailsScreen/:bookingConfirmedDetails',
          args: FoodProductBookingConfirmedDetailsArgs(
            key: key,
            advancePendingDetails: advancePendingDetails,
          ),
        );

  static const String name = 'FoodProductBookingConfirmedDetails';
}

class FoodProductBookingConfirmedDetailsArgs {
  const FoodProductBookingConfirmedDetailsArgs({
    this.key,
    required this.advancePendingDetails,
  });

  final _i12.Key? key;

  final _i13.AdvancePendingResponse advancePendingDetails;

  @override
  String toString() {
    return 'FoodProductBookingConfirmedDetailsArgs{key: $key, advancePendingDetails: $advancePendingDetails}';
  }
}

/// generated route for
/// [_i10.BottomBar]
class BottomBar extends _i11.PageRouteInfo<void> {
  const BottomBar()
      : super(
          BottomBar.name,
          path: '/bottomBar',
        );

  static const String name = 'BottomBar';
}
