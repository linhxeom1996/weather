import 'package:injectable/injectable.dart';
import 'package:softbase/core/basecubit/base_cubit.dart';

import 'bottom_tab.dart';

@singleton
class BottomCubit extends BaseCubit<BottomTab>{
  BottomCubit(): super(BottomTab.home);

  void updateTab(BottomTab tab){
    emit(tab);
  }
}