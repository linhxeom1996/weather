import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/reponses/auth_reponse.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: "", parser: Parser.MapSerializable)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @GET('')
  Future<HttpResponse<LoginReponse>> loginUser({
    @Query('username') String? userName,
    @Query('password') String? password,
  });
}
