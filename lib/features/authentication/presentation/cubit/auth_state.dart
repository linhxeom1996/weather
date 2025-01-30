import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

@CopyWith()
class AuthState extends Equatable {
  final String? errorEmail;
  const AuthState({this.errorEmail});

  @override
  List<Object?> get props => [errorEmail];
}
