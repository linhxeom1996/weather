import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

@CopyWith()
abstract class LoginState extends Equatable {
  final bool? isLoginned;

  @override
  List<Object?> get props => [isLoginned];

  const LoginState({this.isLoginned});
}

class InitLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  const SuccessLoginState({super.isLoginned});
}

class FailedLoginState extends LoginState {
  const FailedLoginState({super.isLoginned});
}
