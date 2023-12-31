import 'package:injectable/injectable.dart';
import 'package:softbase/domain/models/reponses/auth_reponse.dart';
import 'package:softbase/domain/models/requests/auth_request.dart';
import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/login/login_state.dart';
import 'package:softbase/utils/resources/data_state.dart';
import 'package:softbase/utils/validations/user_validation.dart';

import '../../../data/di/injector.dart';
import '../../../domain/repositories/api_repository.dart';

@singleton
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final _apiRepository = getIt.get<ApiRepository>();
  final _userValidation = getIt.get<UserValidate>();

  void emailValidate({required String email}) {
    var isValid = _userValidation.emailValid(email);
    emit(state.copyWith(emailValid: isValid));
  }

  void phoneValidate({required String phone}) {
    var isValid = _userValidation.phoneValid(phone);
    emit(state.copyWith(phoneValid: isValid));
  }

  void passValidate({required String pass}) {
    var isValid = _userValidation.passValid(pass);
    emit(state.copyWith(passValidCase: isValid));
  }

  Future login({required String username, required String password}) async {
    if (isBusy) return;
    await run(() async {
      final reponse = await _apiRepository.loginUser(
          request: LoginRequest(password: password, username: username));
      if (reponse is DataSuccess) {
        if (reponse.data != null && reponse.data!.data != null) {
          getIt.registerSingleton<DataUser>(reponse.data!.data!);
          emit(state.copyWith());
        }
      }
    });
  }
}
