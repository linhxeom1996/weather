import 'package:flutter/material.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';

import '../../../utils/constains/colors.dart';
import 'bottom_cubit.dart';
import 'bottom_tab.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState
    extends BaseStateScreen<BottomCubit, BottomTab, BottomView> {
  @override
  void initState() {
    localStorage.setIsFirstOpen();
    super.initState();
  }

  @override
  Widget body(BuildContext context, BottomTab state) {
    return state.screen(context);
  }

  @override
  BottomNavigationBar? bottomNavigationBar(
      BuildContext context, BottomTab state) {
    return BottomNavigationBar(
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
                    state == tab ? tab.icon(true) : tab.icon(false),
                    const SizedBox(height: 7),
                    Text(tab.name,
                        style: state == tab
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
        cubit.updateTab(BottomTab.values[index]);
      },
    );
  }
}
