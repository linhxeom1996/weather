import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/cubits/bottom/bottom_cubit.dart';
import '../../presentation/cubits/home/home_cubit.dart';
import '../../presentation/cubits/search/search_cubit.dart';
import '../../presentation/cubits/theme/theme_cubit.dart';

class MultiProviderApp extends StatelessWidget {
  final Widget child;
  const MultiProviderApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => BottomCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SearchCubit())
      ],
      child: child,
    );
  }
}
