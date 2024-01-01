import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/forgot_pass/forgot_pass_state.dart';

class ForgotPassCubit extends BaseCubit<ForgotPassState> {
  ForgotPassCubit() : super(const ForgotPassState());

  Future changePass({required String password}) async {
    if (isBusy) return;
    await run(() async {});
  }
}
