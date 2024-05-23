import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/reponses/auth_reponse.dart';

part 'register_api_service.g.dart';

@RestApi(baseUrl: "", parser: Parser.MapSerializable)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST("")
  Future<HttpResponse<RegisterReponse>> createUser(
      {@Query('username') String? username});
}
