import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:softbase/domain/models/reponses/auth_reponse.dart';
import 'package:softbase/utils/constains/strings.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @GET('')
  Future<HttpResponse<LoginReponse>> loginUser({
    @Query('username') String? userName,
    @Query('password') String? password,
  });
}
