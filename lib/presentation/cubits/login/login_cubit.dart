import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/login/login_state.dart';

@singleton
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(InitLoginState());

  Future<bool> login() async {
    emit(const SuccessLoginState(isLoginned: true));
    return true;
  }
}
