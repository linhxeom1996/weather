import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/data/datasources/remote/login_api_service.dart';
import 'package:softbase/data/datasources/remote/register_api_service.dart';
import 'package:softbase/data/di/injector.config.dart';
import 'package:softbase/data/repositories/network/api_repository_impl.dart';

import '../../utils/validations/user_validation.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetit',
  preferRelativeImports: true,
  asExtension: false,
)
configureDependencies() {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  getIt.registerSingleton<UserValidate>(UserValidate());
  // getIt.registerSingleton<FirestoreManager>(FirestoreManager());


  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<LoginApiService>(LoginApiService(getIt<Dio>()));
  getIt.registerSingleton<RegisterApiService>(
      (RegisterApiService(getIt<Dio>())));

  getIt.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(getIt<LoginApiService>(), getIt<RegisterApiService>()));

  $initGetit(getIt);
}
