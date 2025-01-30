import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/export.dart';

class ImageWidget extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageWidget(
      {required this.asset,
      this.color,
      this.fit,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (asset.contains('png') ||
        asset.contains('jpg') ||
        asset.contains('jpeg')) {
      return Image.asset(asset,
          color: color, height: height, width: width, fit: fit ?? BoxFit.fill);
    } else if (asset.contains('svg')) {
      return SvgPicture.asset(asset,
          color: color,
          width: width,
          fit: fit ?? BoxFit.contain,
          height: height);
    } else if (asset.contains("json")) {
      return Lottie.asset(asset, width: width, height: height, fit: fit);
    } else {
      return const Text("Error Image!");
    }
  }
}

class NetWorkImageWidget extends StatelessWidget {
  final String imageUrl;
  final int? typeLoading;

  const NetWorkImageWidget(
      {super.key, required this.imageUrl, this.typeLoading});

  @override
  Widget build(BuildContext context) {
    Widget loading = Image.asset(IconApp.ic_loading_op1, fit: BoxFit.contain);
    switch (typeLoading) {
      case 1:
        loading = Lottie.asset(IconApp.ic_loading_op2, fit: BoxFit.contain);
        break;
      case 2:
        loading = Image.asset(IconApp.ic_loading_op3, fit: BoxFit.contain);
        break;
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      filterQuality: FilterQuality.low,
      imageBuilder: (context, image) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fill)),
      ),
      placeholder: (context, url) => Container(
        child: loading,
      ),
      errorWidget: (context, url, error) => Container(
        child: loading,
      ),
    );
  }
}
