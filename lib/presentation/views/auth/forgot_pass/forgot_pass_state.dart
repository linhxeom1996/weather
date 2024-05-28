import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'forgot_pass_state.g.dart';

@CopyWith()
class ForgotPassState extends Equatable {
  final bool? isChangeSuccess;
  final bool? isFailed;
  const ForgotPassState({this.isChangeSuccess, this.isFailed});
  @override
  List<Object?> get props => [isChangeSuccess, isFailed];
}
