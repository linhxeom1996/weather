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

import '../../presentation/cubits/login/login_cubit.dart' as _i6;
import '../datasources/firebase/events/analytic_events.dart' as _i3;
import '../datasources/firebase/firestore/firestore_manager.dart' as _i4;
import '../datasources/firebase/remote_config/remote_config_manager.dart'
    as _i7;
import '../datasources/local/local_storage.dart' as _i5;

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
  gh.singleton<_i4.FireStoreManager>(_i4.FireStoreManagerImpl());
  gh.singleton<_i5.LocalStorage>(_i5.LocalStorageImpl());
  gh.singleton<_i6.LoginCubit>(_i6.LoginCubit());
  gh.singleton<_i7.RemoteConfigService>(_i7.RemoteConfigService());
  return getIt;
}
