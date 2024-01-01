// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ForgotPassStateCWProxy {
  ForgotPassState isChangeSuccess(bool? isChangeSuccess);

  ForgotPassState isFailed(bool? isFailed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPassState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPassState(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPassState call({
    bool? isChangeSuccess,
    bool? isFailed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfForgotPassState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfForgotPassState.copyWith.fieldName(...)`
class _$ForgotPassStateCWProxyImpl implements _$ForgotPassStateCWProxy {
  const _$ForgotPassStateCWProxyImpl(this._value);

  final ForgotPassState _value;

  @override
  ForgotPassState isChangeSuccess(bool? isChangeSuccess) =>
      this(isChangeSuccess: isChangeSuccess);

  @override
  ForgotPassState isFailed(bool? isFailed) => this(isFailed: isFailed);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPassState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPassState(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPassState call({
    Object? isChangeSuccess = const $CopyWithPlaceholder(),
    Object? isFailed = const $CopyWithPlaceholder(),
  }) {
    return ForgotPassState(
      isChangeSuccess: isChangeSuccess == const $CopyWithPlaceholder()
          ? _value.isChangeSuccess
          // ignore: cast_nullable_to_non_nullable
          : isChangeSuccess as bool?,
      isFailed: isFailed == const $CopyWithPlaceholder()
          ? _value.isFailed
          // ignore: cast_nullable_to_non_nullable
          : isFailed as bool?,
    );
  }
}

extension $ForgotPassStateCopyWith on ForgotPassState {
  /// Returns a callable class that can be used as follows: `instanceOfForgotPassState.copyWith(...)` or like so:`instanceOfForgotPassState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ForgotPassStateCWProxy get copyWith => _$ForgotPassStateCWProxyImpl(this);
}
