import 'package:flutter/widgets.dart';

class ListViewBase extends StatelessWidget {
  final int? itemCount;
  final Widget? Function(BuildContext, int) builder;
  final bool? scrollHorizontal;
  final bool? expanded;
  final ScrollController? controller;
  const ListViewBase(
      {super.key,
      this.itemCount = 0,
      required this.builder,
      this.scrollHorizontal = false,
      this.expanded = true,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OverScrollCus(),
      child: expanded == false
          ? ListView.builder(
              controller: controller,
              itemCount: itemCount,
              shrinkWrap: true,
              scrollDirection:
                  scrollHorizontal == true ? Axis.horizontal : Axis.vertical,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => builder(context, index))
          : Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: itemCount,
                  scrollDirection: scrollHorizontal == true
                      ? Axis.horizontal
                      : Axis.vertical,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => builder(context, index)),
            ),
    );
  }
}

class GridViewBase extends StatelessWidget {
  final int? itemCount;
  final Widget? builder;
  final int crossAxisCount;
  final double? crossAxisSpacing;
  final double? childAspectRatio;
  final double? mainAxisSpacing;
  final double? mainAxisExtent;
  final bool? expanded;
  final ScrollController? controller;
  const GridViewBase(
      {super.key,
      this.itemCount,
      this.builder,
      required this.crossAxisCount,
      this.childAspectRatio,
      this.crossAxisSpacing,
      this.mainAxisExtent,
      this.mainAxisSpacing,
      this.expanded = true,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OverScrollCus(),
      child: expanded == false
          ? GridView.builder(
              controller: controller,
              itemCount: itemCount,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing ?? 0.0,
                  childAspectRatio: childAspectRatio ?? 1.0,
                  mainAxisSpacing: mainAxisSpacing ?? 0.0,
                  mainAxisExtent: mainAxisExtent),
              itemBuilder: (context, index) {
                return builder;
              })
          : Expanded(
              child: GridView.builder(
                  controller: controller,
                  itemCount: itemCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: crossAxisSpacing ?? 0.0,
                      childAspectRatio: childAspectRatio ?? 1.0,
                      mainAxisSpacing: mainAxisSpacing ?? 0.0,
                      mainAxisExtent: mainAxisExtent),
                  itemBuilder: (context, index) {
                    return builder;
                  }),
            ),
    );
  }
}

class CustomScrollViewBase extends StatelessWidget {
  final ScrollController? controller;
  final List<Widget> slivers;
  final bool? expanded;
  const CustomScrollViewBase(
      {super.key, this.controller, required this.slivers, this.expanded});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OverScrollCus(),
      child: expanded == false
          ? CustomScrollView(
              shrinkWrap: true,
              controller: controller,
              slivers: slivers,
            )
          : Expanded(
              child: CustomScrollView(
                controller: controller,
                slivers: slivers,
              ),
            ),
    );
  }
}

class OverScrollCus extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class ScrollViewBase extends StatelessWidget {
  final Widget child;
  const ScrollViewBase({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: OverScrollCus(),
        child: SingleChildScrollView(
          child: child,
        ));
  }
}
