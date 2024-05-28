// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/views/auth/forgot_pass/forgot_pass_cubit.dart'
    as _i6;
import '../../presentation/views/auth/login/login_cubit.dart' as _i9;
import '../../presentation/views/auth/register/register_cubit.dart' as _i10;
import '../../presentation/views/bottom/bottom_cubit.dart' as _i4;
import '../../presentation/views/home/home_cubit.dart' as _i7;
import '../../presentation/views/search/search_cubit.dart' as _i12;
import '../../presentation/views/theme_manager/theme_manager.dart' as _i13;
import '../datasources/firebase/events/analytic_events.dart' as _i3;
import '../datasources/firebase/remote_config/remote_config_manager.dart'
    as _i11;
import '../datasources/local/local_storage.dart' as _i8;
import '../repositories/firestore/firestore_manager.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetit(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AnalyticEvent>(_i3.AnalyticEventImpl());
  gh.singleton<_i4.BottomCubit>(_i4.BottomCubit());
  gh.singleton<_i5.FireStoreManager>(_i5.FireStoreManagerImpl());
  gh.singleton<_i6.ForgotPassCubit>(_i6.ForgotPassCubit());
  gh.singleton<_i7.HomeCubit>(_i7.HomeCubit());
  gh.singleton<_i8.LocalStorage>(_i8.LocalStorageImpl());
  gh.singleton<_i9.LoginCubit>(_i9.LoginCubit());
  gh.singleton<_i10.RegisterCubit>(_i10.RegisterCubit());
  gh.singleton<_i11.RemoteConfigService>(_i11.RemoteConfigService());
  gh.singleton<_i12.SearchCubit>(_i12.SearchCubit());
  gh.singleton<_i13.ThemeManager>(_i13.ThemeManager());
  return getIt;
}
