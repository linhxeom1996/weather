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

import '../../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i6;
import '../../features/authentication/domain/repositories/auth_repository.dart'
    as _i5;
import '../../features/authentication/presentation/cubit/auth_cubit.dart'
    as _i4;
import '../../features/bottom_tab/bottom_cubit.dart' as _i7;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/search/presentation/cubit/search_cubit.dart' as _i12;
import '../local_storage/local_storage.dart' as _i10;
import '../network/connectivity_helper/connectivity_checker_helper.dart' as _i8;
import '../network/firebase/events/analytic_events.dart' as _i3;
import '../network/firebase/remote_config/remote_config_manager.dart' as _i11;
import '../theme/theme_manager.dart' as _i13;

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
  gh.singleton<_i4.AuthCubit>(_i4.AuthCubit());
  gh.factory<_i5.AuthRepository>(() => _i6.AuthRepositoryImpl());
  gh.singleton<_i7.BottomCubit>(_i7.BottomCubit());
  gh.factory<_i8.ConnectivityCheckerHelper>(
      () => _i8.ConnectivityCheckerHelper());
  gh.singleton<_i9.HomeCubit>(_i9.HomeCubit());
  gh.singleton<_i10.LocalStorage>(_i10.LocalStorageImpl());
  gh.singleton<_i11.RemoteConfigService>(_i11.RemoteConfigService());
  gh.singleton<_i12.SearchCubit>(_i12.SearchCubit());
  gh.singleton<_i13.ThemeManager>(_i13.ThemeManager());
  return getIt;
}
