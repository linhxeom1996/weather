import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import 'forgot_pass_state.dart';

@singleton
class ForgotPassCubit extends BaseCubit<ForgotPassState> {
  ForgotPassCubit() : super(const ForgotPassState());

  Future changePass({required String password}) async {
    if (isBusy) return;
    await run(() async {});
  }
}
