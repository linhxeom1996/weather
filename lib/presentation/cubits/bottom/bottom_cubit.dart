import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/bottom/bottom_tab.dart';

class BottomCubit extends BaseCubit<BottomTab>{
  BottomCubit(): super(BottomTab.home);

  void updateTab(BottomTab tab){
    emit(tab);
  }
}