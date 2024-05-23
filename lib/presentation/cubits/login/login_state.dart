import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/enums/password_type.dart';

part 'login_state.g.dart';

@CopyWith()
 class LoginState extends Equatable {
  final bool? isLoginned;
  final bool? emailValid;
  final bool? phoneValid;
  final PasswordCase? passValidCase;
  final bool? loginSuccess;
  final bool? loginFailed;

  @override
  List<Object?> get props =>
      [isLoginned, emailValid, passValidCase, loginSuccess, loginFailed, phoneValid];

  const LoginState(
      {this.isLoginned,
      this.emailValid,
      this.passValidCase,
      this.loginSuccess,
      this.loginFailed, this.phoneValid});
}

// class InitLoginState extends LoginState {}

// class SuccessLoginState extends LoginState {
//   const SuccessLoginState({super.isLoginned});
// }

// class FailedLoginState extends LoginState {
//   const FailedLoginState({super.isLoginned});
// }
