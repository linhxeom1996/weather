import 'package:softbase/domain/models/requests/auth_request.dart';
import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/register/register_state.dart';
import 'package:softbase/utils/resources/data_state.dart';

import '../../../data/di/injector.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/validations/user_validation.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final _apiRepository = getIt.get<ApiRepository>();
  final _userValidation = getIt.get<UserValidate>();

  void emailValidate({required String email}) {
    var isValid = _userValidation.emailValid(email);
    // emit(state.copyWith(emailValid: isValid));
  }

  void phoneValidate({required String phone}) {
    var isValid = _userValidation.phoneValid(phone);
    // emit(state.copyWith(phoneValid: isValid));
  }

  void passValidate({required String pass}) {
    var isValid = _userValidation.passValid(pass);
    // emit(state.copyWith(passValidCase: isValid));
  }

  Future createUser(
      {required String username, required String password}) async {
    if (isBusy) return;
    await run(() async {
      final reponse = _apiRepository.createUser(
          request: SignUpRequest(
              email: "",
              firstname: "",
              lastname: "",
              password: password,
              username: username));
      if (reponse is DataSuccess) {
      } else if (reponse is DataFailed) {}
    });
  }
}
