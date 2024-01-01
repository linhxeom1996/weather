import 'package:softbase/domain/models/reponses/auth_reponse.dart';
import 'package:softbase/domain/models/requests/auth_request.dart';

import '../../utils/resources/data_state.dart';

abstract class ApiRepository {

  Future<DataState<LoginReponse>> loginUser({required LoginRequest request});

  Future<DataState<RegisterReponse>> createUser(
      {required SignUpRequest request});
}
