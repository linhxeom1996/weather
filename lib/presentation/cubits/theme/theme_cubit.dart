import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/presentation/cubits/theme/theme_state.dart';

import '../../../config/themes/themes.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit():super(ThemeState(themeData[AppTheme.pinkLight]));

  void updateTheme({required AppTheme theme}){
    emit(ThemeState(themeData[theme]));
  }
}