import 'package:softbase/data/datasources/remote/login_api_service.dart';
import 'package:softbase/data/datasources/remote/register_api_service.dart';
import 'package:softbase/domain/models/reponses/auth_reponse.dart';

import 'package:softbase/domain/models/requests/auth_request.dart';

import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import 'base/base_api_repository.dart';

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
