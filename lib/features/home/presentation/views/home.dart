import 'package:flutter/material.dart';
import 'package:softbase/core/basescreen/base_screen.dart';
import 'package:softbase/core/constants/app_assets.dart';
import 'package:softbase/core/constants/colors.dart';
import 'package:softbase/core/constants/dimens.dart';
import 'package:softbase/core/utils/extensions/context_ext.dart';
import 'package:softbase/features/home/utils/enum/weather_type.dart';
import 'package:softbase/features/widgets/image_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseStateScreen<HomeCubit, HomeState, HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context, state) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          const ImageWidget(
              asset: AppAssets.imagesBgHome,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const VSpacing(spacing: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: ColorApp.transparent,
                            child: Row(
                              children: <Widget>[
                                const ImageWidget(
                                    asset: AppAssets.imagesIcLocation,
                                    width: 31,
                                    height: 31),
                                const HSpacing(spacing: 4),
                                Text(
                                  "Minsk",
                                  style: context.myTheme.textThemeT1.body,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const ImageWidget(
                              asset: AppAssets.imagesIcMenu,
                              width: 32,
                              height: 32),
                        )
                      ],
                    ),
                    const VSpacing(spacing: 30),
                    Text(
                      "June 07",
                      style: context.myTheme.textThemeT1.body.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const VSpacing(spacing: 12),
                    Text(
                      "Updated 6/7/2023 5:55 PM",
                      style: context.myTheme.textThemeT1.body.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VSpacing(spacing: 12),
                    const ImageWidget(
                      asset: AppAssets.imagesIcClear,
                      width: 95,
                      height: 95,
                    ),
                    Text(
                      "Clear",
                      style: context.myTheme.textThemeT1.body.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            "-1",
                            style: context.myTheme.textThemeT1.body.copyWith(
                              fontSize: 86,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "ºC",
                          style: context.myTheme.textThemeT1.body.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const VSpacing(spacing: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          List.generate(WeatherType.values.length, (index) {
                        final item = WeatherType.values[index];
                        return Column(
                          children: <Widget>[
                            ImageWidget(
                              asset: item.icon,
                              width: 30,
                              height: 30,
                            ),
                            const VSpacing(spacing: 4),
                            Text(
                              item.name,
                              style: context.myTheme.textThemeT1.caption,
                            ),
                            const VSpacing(spacing: 4),
                            Text(
                              item.name,
                              style: context.myTheme.textThemeT1.caption,
                            ),
                          ],
                        );
                      }),
                    ),
                    const VSpacing(spacing: 40),
                    Container(
                      height: 153,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: ColorApp.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(24)),
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const HSpacing(spacing: 12),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, indexChild) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Wed 16",
                                  style: context.myTheme.textThemeT1.caption,
                                ),
                                const VSpacing(spacing: 8),
                                const SizedBox(
                                  width: 41,
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ImageWidget(
                                      asset: AppAssets.imagesIcSun,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const VSpacing(spacing: 4),
                                Text("  22º",
                                    style: context.myTheme.textThemeT1.body),
                                const VSpacing(spacing: 8),
                                Text("1-5\nkm/h",
                                    textAlign: TextAlign.center,
                                    style: context.myTheme.textThemeT1.body
                                        .copyWith(fontSize: 10))
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
