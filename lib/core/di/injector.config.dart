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

import '../../features/home/data/datasource/home_remote_datasource.dart' as _i6;
import '../../features/home/data/repositories/home_repository_impl.dart' as _i8;
import '../../features/home/domain/repositories/home_repository.dart' as _i7;
import '../../features/home/domain/usercase/home_usercase.dart' as _i12;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i13;
import '../local_storage/local_storage.dart' as _i9;
import '../network/connectivity_helper/connectivity_checker_helper.dart' as _i4;
import '../network/dio/dio_client.dart' as _i5;
import '../network/firebase/events/analytic_events.dart' as _i3;
import '../network/firebase/remote_config/remote_config_manager.dart' as _i10;
import '../theme/theme_manager.dart' as _i11;

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
  gh.factory<_i4.ConnectivityCheckerHelper>(
      () => _i4.ConnectivityCheckerHelper());
  gh.singleton<_i5.DioClient>(_i5.DioClient());
  gh.factory<_i6.HomeRemoteDataSource>(
      () => _i6.HomeRemoteDataSourceImpl(gh<_i5.DioClient>()));
  gh.factory<_i7.HomeRepository>(
      () => _i8.HomeRepositoryImpl(gh<_i6.HomeRemoteDataSource>()));
  gh.singleton<_i9.LocalStorage>(_i9.LocalStorageImpl());
  gh.singleton<_i10.RemoteConfigService>(_i10.RemoteConfigService());
  gh.singleton<_i11.ThemeManager>(_i11.ThemeManager());
  gh.factory<_i12.GetWeatherDataByCoordinates>(
      () => _i12.GetWeatherDataByCoordinates(gh<_i7.HomeRepository>()));
  gh.singleton<_i13.HomeCubit>(
      _i13.HomeCubit(gh<_i12.GetWeatherDataByCoordinates>()));
  return getIt;
}
