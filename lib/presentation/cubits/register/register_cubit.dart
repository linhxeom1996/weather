import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/register/register_state.dart';

import '../../../data/di/injector.dart';
import '../../../domain/repositories/api_repository.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final _apiRepository = getIt.get<ApiRepository>();

  Future createUser()async{
    if(isBusy) return;
    await run(() async{
      
    });
  }
}
