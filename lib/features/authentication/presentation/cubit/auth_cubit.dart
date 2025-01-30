import 'package:injectable/injectable.dart';
import 'package:softbase/core/basecubit/base_cubit.dart';
import 'package:softbase/features/authentication/presentation/cubit/auth_state.dart';

@singleton
class AuthCubit extends BaseCubit<AuthState> {
  AuthCubit() : super(const AuthState());
}
