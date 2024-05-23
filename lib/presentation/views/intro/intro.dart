import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/config/routes/app_router.dart';

import '../../../domain/views/intro/intro_model.dart';
import '../../../utils/constains/export.dart';
import '../../widgets/button_base.dart';
import '../../widgets/image_widget.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  final List<IntroInfoModel> _listItems = [
    IntroInfoModel(
        image: IconApp.img_intro_1,
        title: "intro_title1".tr(),
        description: "intro_description1".tr()),
    IntroInfoModel(
        image: IconApp.img_intro_2,
        title: "intro_title2".tr(),
        description: "intro_description2".tr()),
    IntroInfoModel(
        image: IconApp.img_intro_3,
        title: "intro_title3".tr(),
        description: "intro_description3".tr())
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var heightScreen = Dimens().size(context).height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.onBackground,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: heightScreen * 2 / 3,
                child: PageView.builder(
                    controller: _controller,
                    itemCount: _listItems.length,
                    onPageChanged: (value) {
                      setState(() {
                        _pageIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ImageWidget(
                            asset: _listItems[index].image,
                            width: heightScreen / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Dimens.sp25, bottom: Dimens.sp12),
                            child: Text(_listItems[index].title,
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          Text(_listItems[index].description,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      );
                    }),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_listItems.length, (index) {
                    return AnimatedContainer(
                      margin:
                          EdgeInsets.only(right: index == 2 ? 0 : Dimens.sp5),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInCubic,
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: _pageIndex == index
                              ? ColorApp.color4F1
                              : ColorApp.color4F1.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                    );
                  }),
                ),
              ),
              ButtonBase(
                onPressed: () {
                  if (_pageIndex < _listItems.length - 1) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  } else {
                    Navigator.pushNamed(context, ArchRouters.home);
                  }
                },
                text: "next".tr(),
                textStyle: Theme.of(context).textTheme.headlineMedium,
                backgroundColor: ColorApp.color4F1,
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.sp50, vertical: Dimens.sp20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
