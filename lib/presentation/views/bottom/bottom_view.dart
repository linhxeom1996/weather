import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/data/datasources/local/local_storage.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/presentation/cubits/bottom/bottom_cubit.dart';

import '../../../utils/constains/colors.dart';
import '../../cubits/bottom/bottom_tab.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  @override
  void initState() {
    getIt.get<LocalStorage>().setIsFirstOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomCubit, BottomTab>(builder: (context, appTab) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorApp.colorB22,
            unselectedItemColor: ColorApp.colorE9E,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: BottomTab.values
                .map((tab) => BottomNavigationBarItem(
                      label: "",
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          appTab == tab ? tab.icon(true) : tab.icon(false),
                          const SizedBox(height: 7),
                          Text(tab.name,
                              style: appTab == tab
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: ColorApp.colorB22)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: ColorApp.colorE9E))
                        ],
                      ),
                    ))
                .toList(),
            onTap: (index) {
              context.read<BottomCubit>().updateTab(BottomTab.values[index]);
            },
          ),
          body: appTab.screen(context),
        );
      }),
    );
  }
}
