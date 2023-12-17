// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forgot_password_screen_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordScreenState {
  String get email => throw _privateConstructorUsedError;
  bool get isBusy => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, bool isBusy, bool success, String errorMessage)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String email, bool isBusy, bool success, String errorMessage)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String email, bool isBusy, bool success, String errorMessage)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordScreenStateCopyWith<ForgotPasswordScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordScreenStateCopyWith<$Res> {
  factory $ForgotPasswordScreenStateCopyWith(ForgotPasswordScreenState value,
          $Res Function(ForgotPasswordScreenState) then) =
      _$ForgotPasswordScreenStateCopyWithImpl<$Res>;
  $Res call({String email, bool isBusy, bool success, String errorMessage});
}

/// @nodoc
class _$ForgotPasswordScreenStateCopyWithImpl<$Res>
    implements $ForgotPasswordScreenStateCopyWith<$Res> {
  _$ForgotPasswordScreenStateCopyWithImpl(this._value, this._then);

  final ForgotPasswordScreenState _value;
  // ignore: unused_field
  final $Res Function(ForgotPasswordScreenState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? isBusy = freezed,
    Object? success = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$InitializedCopyWith<$Res>
    implements $ForgotPasswordScreenStateCopyWith<$Res> {
  factory _$$InitializedCopyWith(
          _$Initialized value, $Res Function(_$Initialized) then) =
      __$$InitializedCopyWithImpl<$Res>;
  @override
  $Res call({String email, bool isBusy, bool success, String errorMessage});
}

/// @nodoc
class __$$InitializedCopyWithImpl<$Res>
    extends _$ForgotPasswordScreenStateCopyWithImpl<$Res>
    implements _$$InitializedCopyWith<$Res> {
  __$$InitializedCopyWithImpl(
      _$Initialized _value, $Res Function(_$Initialized) _then)
      : super(_value, (v) => _then(v as _$Initialized));

  @override
  _$Initialized get _value => super._value as _$Initialized;

  @override
  $Res call({
    Object? email = freezed,
    Object? isBusy = freezed,
    Object? success = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$Initialized(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initialized implements Initialized {
  const _$Initialized(
      {required this.email,
      required this.isBusy,
      this.success = false,
      this.errorMessage = ''});

  @override
  final String email;
  @override
  final bool isBusy;
  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ForgotPasswordScreenState.initialized(email: $email, isBusy: $isBusy, success: $success, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialized &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      __$$InitializedCopyWithImpl<_$Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, bool isBusy, bool success, String errorMessage)
        initialized,
  }) {
    return initialized(email, isBusy, success, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String email, bool isBusy, bool success, String errorMessage)?
        initialized,
  }) {
    return initialized?.call(email, isBusy, success, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String email, bool isBusy, bool success, String errorMessage)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(email, isBusy, success, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized implements ForgotPasswordScreenState {
  const factory Initialized(
      {required final String email,
      required final bool isBusy,
      final bool success,
      final String errorMessage}) = _$Initialized;

  @override
  String get email;
  @override
  bool get isBusy;
  @override
  bool get success;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}
