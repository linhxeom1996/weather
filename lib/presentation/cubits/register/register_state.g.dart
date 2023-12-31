// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterStateCWProxy {
  RegisterState isFailed(bool? isFailed);

  RegisterState isLoading(bool? isLoading);

  RegisterState isSuccess(bool? isSuccess);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterState call({
    bool? isFailed,
    bool? isLoading,
    bool? isSuccess,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterState.copyWith.fieldName(...)`
class _$RegisterStateCWProxyImpl implements _$RegisterStateCWProxy {
  const _$RegisterStateCWProxyImpl(this._value);

  final RegisterState _value;

  @override
  RegisterState isFailed(bool? isFailed) => this(isFailed: isFailed);

  @override
  RegisterState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override
  RegisterState isSuccess(bool? isSuccess) => this(isSuccess: isSuccess);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterState call({
    Object? isFailed = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isSuccess = const $CopyWithPlaceholder(),
  }) {
    return RegisterState(
      isFailed: isFailed == const $CopyWithPlaceholder()
          ? _value.isFailed
          // ignore: cast_nullable_to_non_nullable
          : isFailed as bool?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool?,
      isSuccess: isSuccess == const $CopyWithPlaceholder()
          ? _value.isSuccess
          // ignore: cast_nullable_to_non_nullable
          : isSuccess as bool?,
    );
  }
}

extension $RegisterStateCopyWith on RegisterState {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterState.copyWith(...)` or like so:`instanceOfRegisterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterStateCWProxy get copyWith => _$RegisterStateCWProxyImpl(this);
}
