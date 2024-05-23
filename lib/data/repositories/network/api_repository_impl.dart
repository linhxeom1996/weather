import 'package:softbase/data/datasources/remote/login_api_service.dart';
import 'package:softbase/data/datasources/remote/register_api_service.dart';

import '../../../domain/reponses/auth_reponse.dart';
import '../../../domain/requests/auth_request.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_api_repository.dart';

abstract class ApiRepository {

  Future<DataState<LoginReponse>> loginUser({required LoginRequest request});

  Future<DataState<RegisterReponse>> createUser(
      {required SignUpRequest request});
}


class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final LoginApiService _loginApiService;
  final RegisterApiService _registerApiService;
  ApiRepositoryImpl( this._loginApiService, this._registerApiService);


  @override
  Future<DataState<LoginReponse>> loginUser({required LoginRequest request}) {
    return getStateOf<LoginReponse>(
        request: () => _loginApiService.loginUser(
              userName: request.username,
              password: request.password,
            ));
  }

  @override
  Future<DataState<RegisterReponse>> createUser(
      {required SignUpRequest request}) {
    return getStateOf<RegisterReponse>(
        request: () => _registerApiService.createUser());
  }
}
