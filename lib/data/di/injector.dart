import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/data/datasources/remote/news_api_service.dart';
import 'package:softbase/data/di/injector.config.dart';
import 'package:softbase/data/repositories/api_repository_impl.dart';
import 'package:softbase/domain/repositories/api_repository.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetit',
  preferRelativeImports: true,
  asExtension: false,
)
configureDependencies() {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt<Dio>()));

  getIt.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(getIt<NewsApiService>()));
      
  $initGetit(getIt);
}
